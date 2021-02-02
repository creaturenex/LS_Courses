# Lesson 2 Exercise 18 Notes Variable Scope More

## Method Definition and Method Invocation

Method definition is when, within our code, we define a Ruby method using the
def keyword.

```ruby
def greeting
  puts "Hello"
end
```

Method invocation is when we call a method, whether that happens to be an
existing method from the Ruby Core API or core Library, or a custom method
that we've defined ourselves using the def keyword.

```ruby
greeting # Calling the greeting method outputs "Hello"
```
Methods can also be invoked within a block or to be more precise blocks is part of the method invocation.

The block acts as an argument to the method.

Example 1: method parameter not used
```ruby
def greetings(str)
  puts "Goodbye"
end

word = "Hello"

greetings(word)

# Outputs 'Goodbye'
```

Example 2: method parameter used
```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)

# Outputs 'Hello'
# Outputs 'Goodbye'
```

The method definition examples above, the method has a parameter.
This allows the method to access the string "Hello" since it is passed in as
an argument at method invocation in the form of the local variable word.
Example 1 doesn't do anything with this string, Example 2 outputs it.
The kind of code in Examples 1 & 2, with a local variable being passed to a
method as an argument

Example 3: block not executed
```ruby
def greetings
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end

# Outputs 'Goodbye'
```
In Example 3 the greetings method is invoked with a block, but the method is not defined to use a block in any way and so the block is not executed.

Example 4: block executed
```ruby
def greetings
  yield # the yield method tells the defined method to execute a block once
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end

# Outputs 'Hello'
# Outputs 'Goodbye'
```
In Example 4 the yield keyword is what controls the interaction with the
block, in this case it executes the block once. Since the block has access
to the local variable word, Hello is output when the block is executed.

**TAKEAWAY** blocks and methods can interact with each other; that
interaction is set by the method definition and then used at method
invocation.

When invoking a method with a block, we aren't just limited to executing
code within the block; depending on the method definition, the method can
use the return value of the block to perform some other action.
Consider the following example:

```ruby
a = "hello"

[1, 2, 3].map { |num| a } # => ["hello", "hello", "hello"]
```

The Array#map method is defined in such a way that it uses the return value
of the block to perform transformation on each element in an array. In the
above example, #map doesn't have direct access to a but it can use the value
of a to perform transformation on the array since the block can access a and
returns it to #map

## Recap

**method definition** as setting a certain scope for any local variables in
terms of the parameters that the method definition has, what it does with
those parameters, and also how it interacts (if at all) with a block.

**method invocation** as using the scope set by the method definition. If
the method is defined to use a block, then the scope of the block can
provide additional flexibility in terms of how the method invocation
interacts with its surroundings.

Summary

The def..end construction in Ruby is method definition
Referencing a method name, either of an existing method or subsequent to
definition, is method invocation
Method invocation followed by {..} or do..end defines a block; the block is
part of the method invocation
Method definition sets a scope for local variables in terms of parameters
and interaction with blocks
Method invocation uses the scope set by the method definition
