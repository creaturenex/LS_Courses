# Collections Basics
Collections are made up of individual elements. I need to learn how collections
are structured, referenced and how elements are assigned in collections.

## Element Reference

### String Element Reference
Strings use integer base index that represent each character in a string.
**! Remember !** index start at the value 0.

![](/LS_Courses/RB101/Lesson_4/image_string_index.png)

example 1
```ruby
str = 'abcdefghi'

str[0]
# => "a"
# or
str[2]
# => "c"
```
You can reference multiple elements in a string by including another parameter

example 2
```ruby
str[2, 3]
# => "cde"
# 1st parameter tells the code to start at index 2.
# 2nd parameter tells the code to select 3 elements starting from the 1st parameter
# str[2, 3] this a another form of saying str.slice(2, 3) See Ruby String Documentation.
```
All methods have a return value. We can use method chaining to to call another
method on the return value.

example 3
```ruby
str[2, 3][0]
# => "c"
# first section str[2, 3] is like example 2 and returns "cde"
# second section [0] is like example 1 and pull the elements at index 0 from "cde" in this case "c"
```
reference `"grass"` from the string below

example 4
```ruby
str = 'The grass is green'

# my code
str[4, 5]
# => "green"
```

### Array Element Reference
Like strings, arrays are also ordered, zero-indexed collections.

![](/LS_Courses/RB101/Lesson_4/image_array_index.png)

array are a list of elements ordered by index where each element can be any
object (ie. string, integer, or even another array). Because arrays use an
integer based index, any elements can be referenced by using its index.

example 5
```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

arr[2]
# => "c"

# or

arr[2, 3]
# => ["c", "d", "e"]
arr[2, 3][0]
# => "c"
```
Just as with `String`, `arr[2, 3]` is alternative syntax for the `Array#slice`
method. NOTE that Array#slice and String#slice are not the same method, even
though they have the same name. They share a lot of the same functionality, but
are separate implementations. One key distinction is that String#slice returns
a new string whereas Array#slice returns a new array.

One situation where Array#slice does not return a new array is if we pass the
method only an index, rather than a start and length or a range; in this case
the element at that index is returned rather than a new array.

example 6
```ruby
arr = [1, 'two', :three, '4']
arr.slice(3, 1) # => ["4"]
arr.slice(3..3) # => ["4"]
arr.slice(3)    # => "4"
```
On lines 2, 3, and 4 in the code above, we are using the element reference
syntax of the Array#slice method. Although these three method calls all target
the same element of arr (the string '4' at index 3), the first two method calls
return that element inside a new array, whereas the third one simply returns
the element itself.

When calling methods such as this on a collection object like an array it is
important to be aware of exactly what is returned, as this will affect how you
can subsequently interact with that return value.

### Hash Element Reference
Hash are another collection data structure. Instead of using integer index, it
uses a key value pair, where the key or the value can be any type of Ruby
object. This allows for a more expansive and descriptive collection of elements.

![](/home/oscar/LS_Courses/RB101/Lesson_4/image_hash_key_value.png)

example 7
```ruby
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit']    # => "apple"
hsh['fruit'][0] # => "a"
```
It is important to note that the `[0]` part of `hsh['fruit'][0]` in the above
example is string element reference. The string `'apple'` is returned by
`hsh['fruit']` and `[0]` is called on that return value.

When initializing a hash, the keys must be **unique**. Try the following code
out in irb.

example 8
```ruby
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
```
```irb
(irb):1: warning: key :fruit is duplicated and overwritten on line 1
=> {"fruit"=>"pear", "vegetable"=>"carrot"}
```
The hash ends up with only two key-value pairs. The first one is over-written
by the third as they have identical keys.

Values, however, **can** be duplicated:
```ruby
hsh = { 'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit' }
```
We can access just the keys or just the values from a hash with the `#keys` and
`#values` methods of `Hash`. These methods return an array:
```ruby
country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys      # => [:uk, :france, :germany]
country_capitals.values    # => ["London", "Paris", "Berlin"]
country_capitals.values[0] # => "London"
```

In the final line of the example above, `[0]` is referencing the item at index
`0` of the array `["London", "Paris", "Berlin"]` since this is the return value
of `country_capitals.values`.

|The above example uses symbols as keys. Although both hash keys and values can be any object in Ruby, it is common practice to use symbols as the keys. Symbols in Ruby can be thought of as immutable strings. There's a number of advantages to using symbols for hash keys, which we won't go into here, but it is important to be aware of this convention.|
-

### Element Reference Gotchas
There are a few things that can catch you off guard when referencing elements
in a collection and you need to be aware of these in order to avoid unintended
behavior in your code.

#### Out of Bounds Indices
We know that strings and arrays are indexed collections and that we can
reference individual elements within the collection via their index.
```ruby
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[2] # => "c"
arr[2] # => "c"
```

The indices of both of these collections run from `0` to `4`. What if we try to
reference using an index greater than `4`?
```ruby
str[5] # => nil
arr[5] # => nil
```

Referencing an out-of-bounds index in this way returns `nil`. This is not
necessarily a problem for a string, since we know that `nil` is an invalid
return value; with an array, `nil` could be a valid return value since arrays
can contain any other type of object, including `nil`.
```ruby
arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil
```

How can we tell the difference between the valid return and the out-of-bounds
reference? Array has a method called `#fetch` which, according to the Ruby docs:

Tries to return the element at position index, but throws an IndexError
exception if the referenced index lies outside of the array bounds.
```ruby
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
             #        from (irb):3:in `fetch'
             #        from (irb):3
             #        from /usr/bin/irb:11:in `<main>'
```

`#fetch` throws an `IndexError` exception if the index is **out of bounds**.
This is very helpful for catching indices that are out of bounds, but which
method is better to use? `#[]` or `#fetch`? `#[]` occurs most often in Ruby
code, but it's actually better to use `#fetch` since it enforces the array
boundaries. The key point here is to be careful when `#[]` returns `nil`.
Always try to think about whether `nil` is the real element in the array or if
it's Ruby's way of telling us we've gone beyond the array boundary. If you
really want to be safe, use `#fetch` in your own code. However, be aware that
most existing Ruby code doesn't use `#fetch`, including much of the code you'll
see here in Launch School.

#### Negative Indices
We've seen what happens if you try to reference an element using an index
greater than the last index of the string or array. What if we use an index
less than 0?
```ruby
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[-2] # => "d"
arr[-2] # => "d"
```

Elements in `String` and `Array` objects can be referenced using negative
indices, starting from the last index in the collection `-1` and working
backwards.

![String Negative Indices](/home/oscar/LS_Courses/RB101/Lesson_4/image_string_negative_index.png)

![Array Negative Indices](/home/oscar/LS_Courses/RB101/Lesson_4/image_array_negative_index.png)

What do you think would be returned by the following calls?
```ruby
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6]
arr[-6]

# These negative indices are also out of bounds.
str[-6] # => nil
arr[-6] # => nil

# We can confirm this by invoking #fetch.
arr.fetch(-6) # => IndexError: index -6 outside of array bounds: -5...5
              #        from (irb):2:in `fetch'
              #        from (irb):2
              #        from /usr/bin/irb:11:in `<main>'
```

#### Invalid Hash Keys
`Hash` also has a `#fetch` method which can be useful when trying to
disambiguate valid hash keys with a `nil` value from invalid hash keys.
```ruby
hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

hsh.fetch(:c)  # => nil
hsh.fetch('c') # => KeyError: key not found: "c"
               #        from (irb):2:in `fetch'
               #        from (irb):2
               #        from /usr/bin/irb:11:in `<main>'
hsh.fetch(:d)  # => KeyError: key not found: :d
               #        from (irb):3:in `fetch'
               #        from (irb):3
               #        from /usr/bin/irb:11:in `<main>'
```

In the above example both the string `'c'` and the symbol `:d` are invalid
keys; the string `'b'` and the symbol `:c` are valid keys. Remember that both
keys and values can be of any object. When referencing an item by its key you
must use the correct object type.

## Conversion
The fact that strings and arrays share similarities, such as both being zero-
indexed collections, lends itself to being able to convert from one to the
other, and this is quite common practice in Ruby code. There are a number of
Ruby methods that facilitate this type of conversion including `String#chars`
and `Array#join`.

`String#chars` returns an array of individual characters.
```ruby
str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]

# Array#join returns a string with the elements of the array joined together.

arr.join # => "Practice"

# Try the following code out in irb.

str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
```

You'll notice that the original string had spaces in between each word but the
final string did not. Why is this? You may want to check the Ruby docs to read
up on `String#split` and `Array#join`.

Can you think of a couple of ways in which the items in the array could be
joined together so that result resembles the original string?
```ruby
arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4] + ' ' + arr[5] + ' ' + arr[6]
# => "How do you get to Carnegie Hall?"

# or

arr.join(' ') # => "How do you get to Carnegie Hall?"

# Hash has a #to_a method, which returns an array.
hsh = { sky: "blue", grass: "green" }
hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]
```

Notice the array that is returned from `#to_a` contains two other arrays, each
sub-array containing a symbol and a string. Each sub-array is equivalent to a
key-value pair from the initial hash.

Just like `Hash` has a `#to_a` method, `Array` has a `#to_h` method. What do
you think would happen if `#to_h` was called on the following array? Read up on
`Array#to_h` in the Ruby documentation and try it out in irb.
```ruby
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
# Note: the Array#to_h method was added in Ruby 2.1.0, if you are using version 2.0.x you will not have access to this method.
```

## Element Assignment

### String Element Assignment
We can use the element assignment notation of String in order to change the
value of a specific character within a string by referring to its index. Say
for example that we wanted to change the first letter of the first word in a
sentence to its uppercase equivalent, we could do this in the following way.
```ruby
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
```

|You may have noticed that the string in the above example uses double quotation marks `"..."`. You might remember from the Strings section of the Introduction to Programming with Ruby book that the reason is because the string itself includes a single quote mark (in the word `"joe's"`) and surrounding the whole string in double quotations is one way to allow this.|
-

Using the same element assignment method, how would you change the first letter
of the remaining words in the sentence to their uppercase versions? Try it out
in a code file or in irb.
```ruby
str = "joe's favorite color is blue"
str[0] = 'J'
str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
str # => "Joe's Favorite Color Is Blue"

# Note that this way of modifying a string is a destructive action; that is,
# the string is changed permanently.
```

### Array Element Assignment
Similar to how we can assign individual characters in a string using their
index, we can assign elements of an array in the same way.
```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]

# In irb or a code file use the same method to increase the value of the rest
# of the integers in the array by 1.

arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]
```

|The statement `arr[0] += 1` in this example is shorthand for `arr[0] = arr[0] + 1`. This combines array element reference and array element assignment and is another example of Ruby's syntactical sugar.|
-

### Hash Element Assignment
Hash element assignment is not too dissimilar. The hash key is used instead of
assigning a value using an index.
```ruby
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }

# In irb or a code file use the same method to set a value of either 'Fruit' or 'Vegetable' to each element in the hash.
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
hsh # => {:apple=>"Fruit", :carrot=>"Vegetable", :pear=>"Fruit", :broccoli=>"Vegetable"}
```

## Summary
We covered the core ways to reference elements or assign values for particular
elements in a collection using some of the various element reference and
element assignment methods of `String`, `Array` and `Hash`.

These concepts are fundamental to working with collections so it's critical to
understand everything we talked about in this assignment before moving forward.
Taking the time to have a clear understanding of these topics will make it much
easier to handle topics that build upon these fundamentals in the future.
