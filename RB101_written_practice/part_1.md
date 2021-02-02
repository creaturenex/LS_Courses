lets describe this part

# Example 1
```ruby
a = 'hello'
b = a
a = 'goodbye'
```
On `line 1` the variable `a` is initialized and assigned the string object with the value of `'hello'`. On `line 2` the variable `b` is initialized and assigned the string object reference by variable `a`. On `line 3` the variable `a` is
reassigned to the string object with a value of `'goodbye'`. Variables are used as pointers for data, ie object. Because of the initialization on `line 1 and 2`, both
variable `a` and `b` point to the same object at that time. When variable `a` is
reassigned on `line 3` the variable is pointing to a different object ie
`"goodbye"`. As a result if we were to call the variable `a` after `line 3` it
would return the string `"goodbye"`, while variable `b` will return the string
`"hello"`.

# Example 2
```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```
On `line 1-8` the method `example` is defined that takes one parameter.
On `line 10` the method `example` is invoked with the string object passed as an argument with a value of `'hello'`.

On `line 2` the variable `i` is initialized and assigned the integer object with a value of `3`.

On `line 3` the method `loop` is invoked with the `do..end` block passed as an argument. The block is passed to the method call as an argument.

On `line 4` the method `puts` is invoked and is passed the string object reference in the method definition parameter as an argument.

On `line 5` the local variable `i` is reassigned. -= is syntactical sugar for reassignment

this is not my note
On line 5 the local variable i is reassigned. -= is actually reassignment and it is Ruby’s syntactical sugar for i = i — 1 . And while we are talking about syntactical sugars, that code is also one, since — is not an operator but a method and that code can also be written as i = i.-(1) . So inside of this code we are actually, reassigning the local variable i to the return value of a method call Integer#- on a local variable i with integer 1 passed to it as an argument.

On `line 6` the loop is broken using the keyword `break` if the comparison evaluates true, ie the value of the object variable `i` referencing is equal to the value `0`.

On `line 10` the method `example` is invoked with the string object passed as an argument with a value of `'hello'`.

the code outputs the string `'hello'` separately 3 times and returns nil as the last line in the code evaluated is `break if i == 0`

# Example 3
Without running the code try to answer what will this code example output
```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```
This code will output on `line 9` 5 and the error undefined variable for `line 10`.

Because of Ruby scoping rules. variables initialize in an outer scope can be accessed inside an inner scope, but the reverse is not true an inner scope variable cannot be accessed by the outer scope if was not initialized in the out scope.

Why?
On `line 1` the local variable `a` is initialized and is the assigned numeric object with a value of `4`

On `line 3` the method `loop` is invoked with the `do..end` block passed as an argument. The block is passed to the method call as an argument. this also create an inner scope which is defined by the do..end block. Everything else outside of that block is the outer scope.

Inside the block on `line 5` the local variable is reassigned to the numeric object with a value of `5`.

On `line 6` the variable `b` is initialized and assigned with the numeric object with a value of `3`. As this variable was initialized inside the `do..end` block, it is only scoped within that level. Once the scope is exited with `break` keyword the variable is no longer accessible to the outer scope.

On `line 10` the code outputs `5` and returns nil
On `line 11` the code outputs an error as we no longer have the variable `b` as it was initialized in the inner scope.

# Example 4
Without running the code try to answer what will this code example output
```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
This code on `line 10` will output `3` and return nil
and on `line 11` will output `2` and return nil

On `line 1` the local variable `a` is initialized and assigned the numeric object with a value of `4`

On `line 4` the loop method is invoked and the `do..end` block is passed as an argument. Inside of this block a new local variable `c` is initialized, which has this block as its scope.

On `line 6` the local variable `a` is reassigned to the object variable `c` was referencing. In this case on `line 5` variable `c` is initialized and assigned the numeric object with a value of `3`. As a result variable `a` now point to the value of `3`. This is possible because this local variable `c` is still within the inner scope defined by the `do..end` block

On `line 10` the `put` method is invoked and passed the local variable `a` which points to `3` due to the reassignment inside the block.

# Example 5
**Variable Shadowing**

Without running the code try to answer what will this code example output.
```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```
The code will output `5` `5` `4` and `2`

This is due to variable shadowing. On `line 1` the local variable `a` is initialized and assigned the numeric object with a value of `4`. On `line 2` the local variable `b` is initialized and assigned the numeric object with a value of `2`

The `times` method is invoked on integer `2` and passed the do..end block as an argument with one parameter `a`. The block is passed to the method call as an argument. Inside of this block a new local variable `a` is initialized , which has this block as its scope. This variable `a` on `line 4` is different than the variable on `line 1`.

this is variable shadowing, the parameter in the block is the same name as the local variable in the outer scope. As a result this prevents the block to access the outer scope variable. As a result on `line 5` we are not reassign the outer variable `a`. But instead assigning the inner scope variable `a` to the numeric object with a value of `5`.


# Example 6

## array#each

**Explain  what `Array#each` , `Array#map` and `Array#select` methods do. First we will start with `Array#each` method and this simple example:**
```ruby
[1, 2, 3, 4].each { |num| puts num }
```
the #each method is invoked on the array `[1, 2, 3, 4]` and passes the block as an argument with one parameter

each iterates through each element in the array and for each element it passes the element to the block and executes it. The each method does not care about the return value for the block.

the method returns the original array

## array#map

The #map method is invoked on the array object `[1, 2, 3, 4]` and passes the block as an argument with one parameter

map iterates through each element in the array and for each element it passes the element to the block and executes it. It uses the return value of the block to create a new element in the new array created by the map method.

When the iteration is complete map will return the new array

## array#select

The #select method iterate through each element in the array object, which has a block as an argument. During each iteration the elements are passed into the block. If the return value of the block evaluates true then that element is selected into a new array. The select method will then return only the array with all elements that were selected when the block returned true.


# Example 7
```ruby
if 3
  puts "I evaluate to true"
else
  puts "I evaluate to false?"
end
```
`3` is not true `1 + 2 == 3` is `true`. The distinction is that because 3 is not `false` or `nil`, then it **evaluate** to `true`.

# Example 8
**Mutating/Non-mutating Ruby methods**

```ruby
a = 'hello'

puts a # -> hello
puts a.object_id # -> 70368527757720 (this number will be different for you)

a.upcase!

puts a # -> HELLO
puts a.object_id  # -> 70368527757720 (this number will be the same as the one
# above)
```
**What is happening here?**

On `line 1` the local variable `a` is initialized with a string object that has a value of `"hello"`
On `line 3` the `puts` method is invoked and passed the string object `"hello"` referenced by variable `a`. This will output the string object `"hello"` and return nil.

On `line 4` is an example of method chaining. The `object_id` method is invoked on the string objected `"hello"` referenced by local variable `a`. This a unique representation of the data location and is represented as a integer. The `puts` method will then output the integer and return `nil`.

On `line 6` the `upcase!` method is invoked on the string object referenced by the local variable `a`. The `upcase!` method mutates the original object it is called on and changes all the characters in a string to capital letters. If no changes where made the method returns `nil`. Mutate in this capacity means it changes the value of the object, but the object stays the same.

On `line 8` the puts method is invoked on the variable `a`, because the method was a mutating method the output is the string with a value `"HELLLO"`. this will still return `nil`.

On `line 9` when we get the object_id of the local variable `a`, it returns the same as `line 4`. This shows that the orginal object was still used but just mutated. If this was a non mutating method this would have return a new string with a different object_id, it is possible to have the same string but a different `object_id`
