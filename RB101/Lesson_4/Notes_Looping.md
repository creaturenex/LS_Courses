# Looping
When working with collections, it's common to perform a single action on each element in a collection. Instead of writing the action over and over again, loops can be used to perform an action on many, if not all, of the elements in a collection.

In the previous assignment we looked at manually incrementing all the integers in an array by 1. Here's a reminder of what that looked like.
```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]
```

You probably noticed that lines 2 - 6 of the above code are almost identical
other than the index of the array that is being referenced. This is a
relatively small array, but imagine if we needed to increment each value in a
much larger array - say, one containing 20 or 30 integers or maybe even more.
That would require the writing of a **lot** of repetitive code. Situations like
this are where we can use a loop to do the hard work for us.
```ruby
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr # => [2, 3, 4, 5, 6]
```

If you understand this code immediately, you can skim the rest of this
assignment. If you have a little bit of trouble with it, make sure to take
notes and pay attention -- it's extremely critical.

## Controlling a Loop
In Ruby, a simple loop is created by calling the `Kernel#loop` method and
passing a block to it. Any code within the block will be executed each time the
loop performs an iteration. Because the `loop` method is in the `Kernel`
module, it's available everywhere, just like `puts` and `gets`.

In the following loop, `'Hello!'` will be printed an infinite number of times.
```ruby
loop do
  puts 'Hello!'
end
```

If we add the reserved word `break` after puts `'Hello!'` then the loop will
only iterate once. This is because when `break` is executed, it exits the
nearest loop.
```ruby
loop do
  puts 'Hello!'
  break
end
```

If we want `loop` to iterate more than once, we can use a conditional statement
so that `break` is only called when a specific condition occurs. For example,
let's say we have a variable named `number` that represents a random number. We
can choose to exit the loop when `number` equals `5` by writing the `if`
condition as `number == 5`.
```ruby
loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
```

## Iteration
Although we have an `if` condition for `break`, we still don't know how many
times the loop will iterate because `number` represents a random number. We can
tell `loop` to iterate a specific number of times by using a variable that
tracks the number of iterations performed. Before `loop` is implemented, let's
assign a variable `counter` that represents the current iteration number.

In order to align the value of `counter` and the number of iterations, we need
to increment `counter` by `1` during each iteration. This will ensure that
`loop` only iterates five times.
```ruby
counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end
```

Notice that `counter` is initialized **outside** of the loop. If we had
initialized it inside of the loop it would be reassigned to `0` on each
iteration and the `break` condition would never be met.

|`if` modifier <br><br> Here we shortened the if statement by changing it to an if modifier. An if modifier is implemented by appending the keyword if and the condition to a statement. In this case, the statement is break. This generally makes the code more readable but should only be used when applicable. If there are multiple lines of code within the if statement then a modifier can't be used (notice we removed the puts ' Exiting...' line).|
-

```ruby
break if number == 5
```

## Break Placement
This example of `loop` - where `break` is placed on the last line within the loop - mimics the behavior of a "do/while" loop. With a "do/while" loop, **the code within the block is guaranteed to execute at least once**.

If we move `break` to the first line within the loop, this will then mimic the
behavior of a `while` loop. The `while` keyword always precedes a condition. If
the condition evaluates to `true`, the loop will execute the code within the
block. If the condition evaluates to `false`, the loop will stop. **This means
the code below `break` may or may not execute at all**, depending on the
condition.

In our example, if we move `break` to the first line within the loop and change
the condition to `counter == 0`, then the loop will stop immediately and not
execute any code after `break`.
```ruby           
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end
```

## Next
Besides `break`, Ruby also provides the `next` keyword to help us control
loops. When `next` is executed, it tells the loop to skip the rest of the
current iteration and begin the next one. We can choose to skip the current
iteration when `counter` represents an odd number by adding an `if` modifier to
`next` with the condition `counter.odd?`.

|Note: `#odd?` is a method of Integer which returns `true` if an integer is `odd` and false if it isn't. (You can check the Ruby documentation for more information on this and other methods).|
-

```ruby
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
```

Notice that when we added `next`, we also had to move `counter += 1` so that
it's executed first. Similar to `break`, when `next` is executed, any code
after it will be ignored. If the `counter` incrementation code was placed after
`next`, then it wouldn't be incremented if next is executed, which will result
in an infinite loop.

The `if` condition also had to be changed from `counter == 5` to `counter > 5` since `5` is an odd number.

## Iterating Over Collections
Now that we understand the basics of looping, we'll look at how we can use
loops to iterate over collections.

### String
Let's implement a loop that iterates over a given string and prints each character.
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end
```

In order to print each character in the string, we need to iterate over the
entire string, and use string reference to retrieve each letter based on its
index. Since our `counter` starts at `0`, we can just use that. We'll `break`
out of the loop when the counter equals the length of the `alphabet` string.

|Note: `String#size` returns the number of characters in the given string. You could also use `String#length` which does the same thing.|
-

To print a specific character in a string, we use the index value associated
with the specific character. Since `counter` represents the current iteration
number, we can use its value as the index value for each character. This
results in every character being printed one at a time.

In the above example, the ordering of `counter += 1` and our break modifier
doesn't matter too much. If we move things around, the worst that can happen is
we get one extra piece of unneeded output, a blank line. Regardless, all
letters of the alphabet will be output. But, the ordering could matter,
depending on various starting conditions. There are some edge cases to take
into account when looping through strings in general.

If our counter somehow surpassed the `alphabet.size modifier`, then we could
end up with an infinite loop. For instance, if we started with an empty string,
and then incremented `counter`, and then checked a condition with the above
`if` modifier, that would cause an infinite loop. Or if `counter` started at
the size of `alphabet`. Then, we would once again get an infinite loop.

Using a more general condition in our `if` modifier may be in order. Using
something like, `break if counter >= alphabet.size`, should do the trick. This
would always guarantee that we `break` out of the loop regardless of whether
`counter` is exactly equal to `alphabet.size` or not.

What if the string includes spaces? Since strings can only contain characters,
we know that a space is also a character. If the string was `'a b c'` for
example, each character would be printed, including the spaces.
```ruby
a   

b

c
```

### Array
To iterate over an array, we can use `loop` in the same way we did with a
string.
```ruby
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end

# What do you think will be output by the loop?
# The result is the string "I'm the color ... !" being printed four times with
# the values of each element interpolated into it each time in order.

I'm the color green!
I'm the color blue!
I'm the color purple!
I'm the color orange!
```

In the above example the array only contains string objects, however, arrays
can contain any type of Ruby object and can contain different types of objects
at the same time.

Let's modify the array so it contains various types of objects. Let's also
modify `puts` so that it prints the name of the class of each object. To do
this, we can use the `class` method which returns the name of the calling
object's class.
```ruby
objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end
```

Now our output looks a bit different.
```irb
String
Symbol
Integer
Array
```

### Hash
Using `loop` to iterate over a hash is a bit more difficult -- it requires a
couple more steps. This is because hashes use key-value pairs instead of a zero-
based index. This means that each value in a hash is associated with a specific
key. Since hash keys can be any type of object, a simple counter variable won't
allow us to fetch the values we want.
```ruby
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
```

To remedy this, we have to create an array containing all of the keys in the
hash. We can do this by using `Hash#keys`, which returns an array containing
all of the keys in the hash. We can then use the new array of keys, `pets`, to
iterate over the hash.

The important thing to realize here is that this is a two step process. First,
we're iterating over the array of keys, `pets`, and saving each key into the
`current_pet` variable. We then use the `current_pet` key to retrieve the
appropriate value out of the `number_of_pets` hash.

The `puts` statement interpolates both the current hash value,
`current_pet_number`, and the current hash key, `current_pet`, into the "I have
... !" string.
```irb
I have 2 dogs!
I have 4 cats!
I have 1 fish!
```

## Summary
Looping comprises four basic elements: a loop, a counter, a way to retrieve the
current value, and a way to exit the loop. It's important to understand how to
manually loop over collections with nothing more than these 4 tools. It's often
tempting to go "method hunting" to search for a method to iterate over a
collection, but if you master the basics of looping, you'll find that you can
perform nearly any operation you need with the simple techniques in this
assignment. Methods can be useful, but they shouldn't be used as a crutch.

In the following assignments, you'll see how to combine looping with a few
other tools to manipulate collections according to your will.
