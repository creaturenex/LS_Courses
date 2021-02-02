# More Methods

There are many useful methods that come out of the box with Ruby, but they're only useful if we thoroughly understand how they work. In this assignment, we're going to take what we learned from the previous assignment to deconstruct how common built-in collection oriented methods work.

One of the best ways to gain knowledge about a method is to consult the Ruby documentation. If you're unfamiliar with this website, we have written a couple of exercise sets - Reading Documentation, Reading Documentation 2, and Documentation Again.

Let's look at a few common Ruby methods and explore how they work.

Enumerable#any?
The first thing you should do when you're unsure of how a method works is to check the Ruby documentation. Take a quick look at the documentation to get an idea for what the method does, and then read the code below. Note that the link points to Enumerable#any?, and not Array#any?, as one might expect. As mentioned in the previous assignment, this is because in Ruby Array and Hash includes the Enumerable module.

Let's write some code with it.
```ruby
[1, 2, 3].any? do |num|
  num > 2
end
# => true
```

There are two return values that we need to be aware of here: the return value of the method and the return value of the block. any? looks at the truthiness of the block's return value in order to determine what the method's return value will be. If the block returns a "truthy" value for any element in the collection, then the method will return true.

any? can also be used with a hash. The only difference is that the block requires two parameters in order to access the key and the value.
```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
# => false
```

The above code returns a boolean, signifying whether any value in the hash is greater than 4.

Enumerable#all?
all? functions in a similar way to any?. It also looks at the truthiness of the block's return value, but the method only returns true if the block's return value in every iteration is truthy (that is, not false or nil).

[1, 2, 3].all? do |num|
  num > 2
end
# => false
all? can also be called on a hash.

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
# => true
Enumerable#each_with_index
each_with_index is nearly identical to each. While both methods take a block and execute the code within the block, the block's return value is ignored. Unlike each, each_with_index takes a second argument which represents the index of each element.

[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]
When calling each_with_index on a hash, the first argument now represents an array containing both the key and the value.

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }
Finally note that just like each, each_with_index always returns the original calling collection.

Enumerable#each_with_object
Besides taking a block like the methods above, each_with_object takes a method argument. The method argument is a collection object that will be returned by the method. On top of that, the block takes 2 arguments of its own. The first block argument represents the current element and the second block argument represents the collection object that was passed in as an argument to the method. Once it's done iterating, the method returns the collection object that was passed in. Sounds confusing, but let's look at an example.

[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]
In the above example, array is initialized to an empty array, []. Inside the block, we can now manipulate array. In this case, we're just appending the current num into it if it's odd.

Similar to each_with_index, the first block argument turns into an array when we invoke each_with_object on a hash.

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]
As an additional quirk, it's possible to use parentheses to capture the key and value in the first block argument.

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
You should probably stick to one format in your own code, but it's nice to know alternative syntax when reading other people's code.

Enumerable#first
first doesn't take a block, but it does take an optional argument which represents the number of elements to return. When no argument is given, it returns only the first element in the collection.

[1, 2, 3].first
# => 1
When an argument is provided, first will return the specified number of elements.

Let's now try to call first on a hash.

{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]
There are a couple of interesting things of note here.

First, hashes are typically thought of as unordered and values are retrieved by keys. In some programming languages, the order is not preserved at all. This used to be true for Ruby too, but since Ruby 1.9, order is preserved according to the order of insertion. Calling first on a hash doesn't quite make sense, but Ruby lets you do it.

Second, notice that the return value of calling first on a hash with a numeric argument is a nested array. This is unexpected. Fortunately, turning this nested array back to a hash is easy enough: [[:a, "ant"], [:b, "bear"]].to_h.

In practice, first is rarely called on a hash, and most often used with arrays.

Enumerable#include?
include? doesn't take a block, but it does require one argument. It returns true if the argument exists in the collection and false if it doesn't.

[1, 2, 3].include?(1)
# => true
When called on a hash, include? only checks the keys, not the values.

{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true
In fact, Hash#include? is essentially an alias for Hash#key? or Hash#has_key?. In practice, Rubyists would usually prefer these methods over include? as they make the intention more explicit.

If we wanted to find out if a value exists within a hash, we could use the Hash#value? or Hash#has_value? methods: hash.has_value?('cat'). These methods have an advantage over, say, calling the Hash#values method and then chaining include? in that there is one less method to call: hash.values.include?('cat').

Enumerable#partition
partition divides up elements in the current collection into two collections, depending on the block's return value. For example:

[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]
The return value is a nested array, with the inner arrays separated based on the return value of the block. The most idiomatic way to use partition is to parallel assign variables to capture the divided inner arrays:

odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

odd  # => [1, 3]
even # => [2]
Even if the collection is a hash, the return value of partition will always be an array.

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
To transform these arrays back into a hash, we can invoke Array#to_h.

long.to_h # => { :b => "bear" }
short.to_h  # => { :a => "ant", :c => "cat" }
Summary
Over the past two assignments you have seen an overview of a number of different methods that can be used for working with collections. While you may not be able to remember all of these right away it is important to know that methods like these exist and that you can use the Ruby documentation in order to find them and understand how they work. You can think of certain sections of the documentation as a sort of manual or guide for how to use certain methods.

Method documentation will normally include:

One or more method signatures (which will indicate whether the method takes arguments and/ or a block and what it returns)
A brief description of how the method is used, often covering different use cases
Some code examples, again usually covering various use cases
By taking the time to read a method's documentation, we can gain a more thorough understanding of how that method works. We're then able to move forward knowing things like:

Whether the method takes a block
How it handles the block's return value
What the method itself returns
Finally, don't worry if you can't remember all these methods and how to use them. At their core, remember that these are looping constructs and as long as you know how to loop or iterate over a collection, you're in good shape. Getting familiar with how these methods work will take your coding chops to the next level.
