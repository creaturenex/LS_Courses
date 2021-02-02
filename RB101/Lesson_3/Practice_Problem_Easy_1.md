# Practice Problems: Easy 1
***
## Question 1
What would you expect the code below to print out?
```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```
Solution 1:

I expect the output to be, as the method `.uniq` did not mutate the array `numbers`.
```ruby
1
2
2
3
```

LS Solution 1:

It prints out
```ruby
1
2
2
3
```
`numbers.uniq` returned a new `Array` object with unique elements, but it did
not modify the `numbers` object. Further, the `puts` method automatically calls
`to_s` on its argument, and that’s why you see the output like above.

Additional note: had the last line been `p` numbers instead, the output would
have been `[1, 2, 2, 3]` because the `p` method automatically calls `inspect`
on its argument, which gives a different formatting on the output. Furthermore,
we could have also done `puts numbers.inspect` and the output would have been
the same as using the `p` method.



## Question 2
Describe the difference between ! and ? in Ruby. And explain what would happen
in the following scenarios:

1. what is `!=` and where should you use it?
2. put `!` before something, like `!user_name`
3. put `!` after something, like `words.uniq!`
4. put `?` before something
5. put `?` after something
6. put `!!` before something, like `!!user_name`

Solution 2

In Ruby the `!` exclamation point or the bang operator in Ruby is used to
evaluate an object as NOT or inverts the truth value of the data, or
**CORRECTION** While `!` is typically used to denote if a method destructive/
mutating. It does not explicitly means a method will modify an object and is
not Ruby syntax, its only part of the method name. To tell if a method is
mutating you have to look at the method definition. The `?` question mark is
used to evaluate an object and return a Boolean answer. `? :` is the ternary operator for if...else

1. What is `!=` and where should you use it?

  `!=` means does not equal, and you should use it when you want to compare a
specific value.

2. Put `!` before something, like `!user_name`

  `!` per IRB tests, ! is inverting the result, as everything in Ruby is truthy
  except for `false` and `nil` the result will be false.

3. Put `!` after something, like `words.uniq!`

  `!` after a method typically modifies the original object. In this case it
  will permanently delete any duplicate characters from the array `words`.

4. Put `?` before something

  There is no object to compare if it is `true` or `false` so it throws a
  syntax error.

5. Put `?` after something

  `?` after an object evaluates whether an object is `true` or `false`

6. Put `!!` before something, like `!!user_name`

`!` per IRB tests, ! is inverting the result, with `!!` a double inversion is
occurring so it would be like saying the original object is true, the first
inversion is false and the second inversion is true.

LS Solution 2:

Just to clarify, if you see `!` or `?` at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

!= means "not equals"
? : is the ternary operator for if...else
!!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
!<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.



## Question 3
Replace the word "important" with "urgent" in this string:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
Solution 3 - matches LS Solution
```ruby
advice.gsub!('important', 'urgent')
```



## Question 4
The Ruby Array class has several methods for removing items from the array.
Two of them have very similar names. Let's see how they differ:
```ruby
numbers = [1, 2, 3, 4, 5]
```
What do the following method calls do (assume we reset numbers to the original
array between method calls)?
```ruby
numbers.delete_at(1)
numbers.delete(1)
```
Solution 4

`numbers.delete_at(1)` Deletes any element in the array at index `1`.
```ruby
#returns
[1, 3, 4, 5]
```
`numbers.delete(1)` Deletes the element `1` from the array.
```ruby
#returns
[2, 3, 4, 5]
```



## Question 5
Programmatically determine if 42 lies between 10 and 100.

hint: Use Ruby's range object in your solution.

Solution 5
```ruby
(10..100).include?(42)
# another option is
(10..100).cover?(42)

```



## Question 6
Starting with the string:
```ruby
famous_words = "seven years ago..."
```
show two different ways to put the expected "Four score and " in front of it.

Solution 6
```ruby
famous_words.prepend("Four score and ")
# or
"Four score and ".concat(famous_words)
```



## Question 7
If we build an array like this:
```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```
We will end up with this "nested" array:
```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```
Make this into an un-nested array.

Solution 7
```ruby
flintstones.flatten!
```



## Question 8
Given the hash below
```ruby
flintstones = { "Fred" => 0,
                "Wilma" => 1,
                "Barney" => 2,
                "Betty" => 3,
                "BamBam" => 4,
                "Pebbles" => 5 }
```
Turn this into an array containing only two elements: Barney's name and
Barney's number

Solution 8
```ruby
# rassoc returns the first key value pair
# assoc returns all key value pairs
flintstones.rassoc(2)
# or
flintstones.assoc(2)
```
