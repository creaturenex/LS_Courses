# Practice_Problems_Methods_More_Methods

# Practice Problem 1
# What is the return value of the select method below?
# Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# Solution
# My Solution is wrong
=> 'hi'
# #.select will evalute what the last line in the block.
# In this example it was a string and a string will return the same value.

# LS Solution
=> [1, 2, 3]
# select performs selection based on the truthiness of the
# block's return value. In this case the return value will always
# be 'hi', which is a "truthy" value. Therefore select will
# return a new array containing all of the elements in the
# original array.



# Practice Problem 2
# How does count treat the block's return value?
# How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# Solution
# My Solution is correct
=> 2
# Using ruby-docs.org under array#count, if a block is given to array#count it
# counts the number of elements for which the block returns true. Or in other words the thruthiness

# LS Solution
=begin
If we don't know how count treats the block's return value, then we should consult the docs for Array#count. Our answer is in the description:

If a block is given, counts the number of elements for which the block returns a true value.

Based on this information, we can conclude that count only counts an element if the block's return value evaluates to true. This means that count considers the truthiness of the block's return value.
=end



# Practice Problem 3
# What is the return value of reject in the following code?
# Why?

[1, 2, 3].reject do |num| #falsy
  puts num # returns nil
end

# Solution
# My Solution is correct
 => [1, 2, 3]
 # will return this array as puts num will always evaluate to nil or not true
 # and from the ruby documentation array#reject returns a new array containing
 # the items in self for which the given block is not true.

# LS Solution
=> [1, 2, 3]
=begin
Since puts always returns nil, you might think that no values would be selected and an empty array would be returned. The important thing to be aware of here is how reject treats the return value of the block. reject returns a new array containing items where the block's return value is "falsey". In other words, if the return value was false or nil the element would be selected.
=end



# Practice Problem 4
# What is the return value of each_with_object in the following code?
# Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# Solution
# My Solution is 90% correct
hash = {a:, "ant", b: 'bear', c: 'cat'}
# I used symbols for the keys and not strings
# ruby documentation says Enumerable#each_with_object will iterate through the # given block with each element & the given object and return the given object
# the given object is a hash and above is what the iteration code produced.

# LS Solution
=> { "a" => "ant", "b" => "bear", "c" => "cat" }
=begin
Based on our knowledge of each, it might be reasonable to think that each_with_object returns the original collection. That isn't the case, though. When we invoke each_with_object, we pass in an object ({} here) as an argument. That object is then passed into the block and its updated value is returned at the end of each iteration. Once each_with_object has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.

In this code, we start with the hash object, {}. On the first iteration, we add "a" => "ant" to the hash. On the second, we add "b" => "bear", and on the last iteration, we add "c" => "cat". Thus, #each_with_object in this example returns a hash with those 3 elements.
=end



# Practice Problem 5
# What does shift do in the following code?
# How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# Solution
# My Solution
=> [:a => 'ant'] #wrong
=> [:a, 'ant'] # correct
# hash#shift removes a key-value pair from a hash and returns it as the two-
# item array [ key, value ], or the hash’s default value if the hash is empty.

# LS Solution



# Practice Problem 6
# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# Solution
# My Solution was wrong, it is the inverse fo what i thought
=> 2
# should be
=> 11
# Array#pop removes the last element in an array and returns it
# String#size will count the number of characters in a string

# LS Solution
=> 11
=begin
There are a couple things going on here. First, pop is being called on the array. pop destructively removes the last element from the calling array and returns it. Second, size is being called on the return value by pop. Once we realize that size is evaluating the return value of pop (which is "caterpillar") then the final return value of 11 should make sense.
=end



# Practice Problem 7
# What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# Solution
# My Solution is partially correct
=> 1
=> 2
=> 3
=>[true, false, true]

# the return value of the block is a boolean true/false and Enumerable#any? will executed the block code if any value in the block return is true

=> 1
=> [true]

#my solution was partially correct it stops at 1 because it any stop working after it finds the ifrist instance of the code being true

# LS Solution
=begin
The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is num.odd?, which returns a boolean. Therefore the block's return value will be a boolean, since Fixnum#odd? can only return true or false.

Since the Array#any? method returns true if the block ever returns a value other than false or nil, and the block returns true on the first iteration, we know that any? will return true. What is also interesting here is any? stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, puts num is only ever invoked for the first item in the array: 1.
=end



# Practice Problem 8
# How does take work?
# Is it destructive?
# How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Solution
# My Solution
=> [1, 2]
# ruby doc, Array#take ,is not destructive, it returns the first (n) elements
# from an array with (n) being a postive interger parameter. I also tested this
# is correct in IRB

# LS Solution
=begin
irb :001 > arr = [1, 2, 3, 4, 5]
irb :002 > arr.take(2)
=> [1, 2]
irb :003 > arr
=> [1, 2, 3, 4, 5]

If you're unsure of how a method works the best thing to do is to read its documentation. Along with that, testing the method in irb can be very helpful. In this case we can quickly check if take is destructive or not by running the code in irb.
By reading the docs and testing the method in irb, we're able to determine that Array#take selects a specified number of elements from an array. We're also able to verify that it isn't a destructive method.
=end



# Practice Problem 9
# What is the return value of map in the following code?
# Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# Solution
# My Solution
two guesses
=>[nil, 'bear']
or
=> ['bear']

# LS Solution
=> [nil, "bear"]
=begin
There are some interesting things to point out here. First, the return value of map is an array, which is the collection type that map always returns. Second, where did that nil come from? If we look at the if condition (value.size > 3), we'll notice that it evaluates to true when the length of value is greater than 3. In this case, the only value with a length greater than 3 is 'bear'. This means that for the first element, 'ant', the condition evaluates to false and value isn't returned.

When none of the conditions in an if statement evaluates as true, the if statement itself returns nil. That's why we see nil as the first element in the returned array.
=end



# Practice Problem 10
# What is the return value of the following code?
# Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# Solution

# My Solution
=>[1, nil, nil]


# LS Solution
=begin
We can determine the block's return value by looking at the return value of the last statement evaluated within the block. In this case it's a bit tricky because of the if statement. For the first element, the if condition evaluates to false, which means num is the block's return value for that iteration. For the rest of the elements in the array, num > 1 evaluates to true, which means puts num is the last statement evaluated, which in turn, means that the block's return value is nil for those iterations.

Therefore, the return value of map is:

# => [1, nil, nil]
=end
