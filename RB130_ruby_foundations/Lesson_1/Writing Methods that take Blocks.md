

# Writing Methods that take Blocks

In Ruby every method can take blocks by using the keyword `Yield`. Remember blocks are written as `do ... end` or `{ block }`. 

- blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.
- blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about wrong number of arguments passed to it.
- blocks return a value, just like normal methods.
- blocks are a way to defer some implementation decisions to method invocation time. It allows method callers to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.
- blocks are a good use case for "sandwich code" scenarios, like closing a `File` automatically.

**Yield** - executes the block given to the method 

``` ruby
def echo_with_yield(str)
  yield
  str
end

echo_with_yield { puts "world" }                        
# => ArgumentError: wrong number of arguments (0 for 1)

echo_with_yield("hello!") { puts "world" }              
# world
# => "hello!"

echo_with_yield("hello", "world!") { puts "world" }     
# => ArgumentError: wrong number of arguments (2 for 1)

echo_with_yield("hello")
# => LocalJumpError
```

If the incorrect number of arguments are pass in to the method, then we get an `ArgumentError`. If no block are pass to the method, then we get a `LocalJumpError`. As the code is currently written we will get an error if a) We try to pass a different number of arguments than was defined. b) Do not use a block. 

To prevent the block error just use `yield` with a conditional.

``` ruby
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end

# clears screen first, then outputs "> hi there"
```



**Yielding with an argument**

Sometimes a block requires an argument and if you recall the block is an argument to the method so you see how it can be complex or confusing

example of a block argument

``` ruby
3.times do |num|
  puts num
end

# |num| is the block parameter
# while inside the block num is the block local variable
```

example of method definition with a block argument, that has block parameter

``` ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1) # The ()interior is the block parameter
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
```

Yield and Block Arguments

```ruby
# method implementation
def test
  yield(1)                              
# passing 1 block argument at block invocation time
end

# method invocation
test do |num1, num2|
# expecting 2 parameters in block implementation
  puts "#{num1} #{num2}"
end
```



Return value of yielding to the block is the same as a method in that the last line executed in a block will be the return value, This allows you to save the block return value to a variable.



Method Implementor and Method Caller

Implementor - Who wrote the method

Caller - Who invokes the method



**Methods with explicit block parameter**

All methods implicitly accept a block, ie still work if no block is provided. If you want to explicitly use a block ie the method requires a block to work, then we use `&block` keyword when defining a method.

``` ruby
def test(&block)
  puts "What's &block? #{block}"
end

test { sleep(1) }
# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil

```

 So when we do explicitly require a block in a method, Ruby passes that block as a simple `Proc` object as a result to invoke the proc ie block, we must use `#call` instead of `#yield`

