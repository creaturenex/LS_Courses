# Lesson 2 Exercise 17 Notes Variable Scope

### Variables and Blocks
Ruby blocks can be write in two ways
- do..end
- {..}

```ruby
[1, 2, 3].each do |num|
  puts num
end

# or

[1, 2, 3].each {|num| puts num}  
```
Typically the do..end method is used for multi-line blocks while {..} is used for single-line blocks

**Ruby blocks create a new scope for local variables**. You can think of the scope created by a block following a method invocation as an inner scope. Nested blocks will create nested scopes. A variable's scope is determined by where it is initialized.

Example 1: outer scope variables can be accessed by inner scope
```ruby
a = 1         # outer scope variable

loop do       # the block following the invocation of the `loop` method creates an inner scope
  puts a      # => 1
  a = a + 1   # "a" is re-assigned to a new value
  break       # necessary to prevent infinite loop
end

puts a        # => 2  "a" was re-assigned in the inner scope
```
**TAKE AWAY** Inner scope variables can access an outer scope variables and that inner scopes can change outer scopes. The opposite is not true, outer scopes **can not** access inter scopes

Example 2: inner scope variables cannot be accessed in outer scope
```Ruby
# the block following the invocation of the `loop` method creates an inner scope
loop do       
  b = 1
  break
end

puts b
# => NameError: undefined local variable or method `b' for main:Object
```
Example 3: peer scopes do not conflict
```ruby
2.times do
  a = 'hi'
  puts a
# 'hi' <= this will be printed out twice due to the loop
end

loop do
  puts a
# => NameError: undefined local variable or method `a' for main:Object
  break
end

puts a
# => NameError: undefined local variable or method `a' for main:Object
```

In Example 3 the issue arises as the variable `a` is already scoped in the first block. That is why we **cannot** use the same variable in the code that follows.

Example 4: nestled blocks
```Ruby
a = 1           # first level variable

loop do         # second level
  b = 2

  loop do       # third level
    c = 3
    puts a      # => 1
    puts b      # => 2
    puts c      # => 3
    break
  end

  puts a        # => 1
  puts b        # => 2
  puts c        # => NameError
  break
end

puts a          # => 1
puts b          # => NameError
puts c          # => NameError
```
Similar to example one with the inner scope being able to access the outer scope only inner and outer are relative to their position in the code.

Example 5: variable shadowing
```Ruby
# some blocks have parameters in this case its inside the | | or n
[1, 2, 3].each do |n|
  puts n
end

# variable shadowing, using a parameter that is also use as a variable in the outer scope. so its like have to of the same variable in the inner scope.
n = 10

[1, 2, 3].each do |n|
  puts n
end
```
So what will happen is that the code will use the variable in the block parameter. It will also prevent us from modifying the outer scope variable.

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
# => 10
```
**TAKEAWAY** Choose long and descriptive variable names to avoid confusion

## Variable and Method Definitions

A method definition has no notion of "outer" or "inner" scope -- you must explicitly pass in any parameters to a method definition. While a block (doesn't matter whether it follows a method invocation) has a scope that "leaks", a method's scope is entirely self-contained. The only variables a method definition has access to must be passed into the method definition.

Example 1: a method definition can't access local variables in another scope
```Ruby
a = 'hi'

def some_method
  puts a
end

# invoke the method
some_method
# => NameError: undefined local variable or method `a' for main:Object
```
Example 2: a method definition can access objects passed in
```Ruby
def some_method(a)
  puts a
end

some_method(5)  # => 5
```
**TAKEAWAY** local variables that are not initialized inside a method definition must be defined as parameters.

## Block within Method Definitions

Block rules remain in place even inside of a method definition

Example 1
```Ruby
def some_method
  a = 1
  5.times do
    puts a
    b = 2 # b is only scoped inside the block
  end

  puts a
  puts b
end

some_method
# => NameError: undefined local variable or method `b' for main:Object
```

## Constants

We have been using two types of variables, constant and local variables.
Scope rules for constant variables is not the same as local variables.

Example 1: In procedural style programming, constant behave like global
```ruby
USERNAME = 'Batman'

def authenticate
  puts "Logging in #{USERNAME}"
end

authenticate
# => Logging in Batman
```

Example 2: constant and method invocation?
```ruby
FAVORITE_COLOR = 'taupe'

1.times do
  puts "I love #{FAVORITE_COLOR}!"  # => I love taupe!
end
```

Example 3: constant in an inner scope
```Ruby
loop do
  MY_TEAM = "Phoenix Suns"
  break
end

puts MY_TEAM    # => Phoenix Suns
```

As you can see they do not behave like local variables. Constants are said to have lexical scoped

**TAKEAWAY** Constants variables behave differently than local variables.
