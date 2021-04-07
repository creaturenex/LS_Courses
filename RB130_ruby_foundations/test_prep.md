# RB130 Test Preo

## Closures in Ruby
***
**Keywords**
- closure
  - an unnamed "chunk of code" that can be saved to be executed later.
- binding
  - a closure's surrounding artifacts ie, variables, methods, objects, etc
- Block
  - a "chunk of code", denoted by `do..end` or `{}`
- Proc
  - a "chunk of code", ie a block saved as a Proc object
- Lambda
  - a "chunk of code", ie a block saved as a Proc object with strict arity rules
- Arity
  - the rules regarding the number of arguments that are passed to a Block, Proc, or Lambda.
- Yield
  - ruby keyword to allow a block to be passed into a method

**Alias**
- method implementation : method definition
- handle : variable
***

A **closure** is a saved "chunk of code" so it can be executed at a later time. In Ruby, a closure is implemented through a Proc object, a lambda, or a block. It's called a "closure" because it's said to bind its surrounding artifacts
(ie, variables, methods, objects, etc) and build an "enclosure" around everything so that they can be referenced when the closure is later executed.

It's sometimes useful to think of a closure as a method that you can pass around
and execute, but it's not defined with an explicit name.


There are three main ways to work with closures in Ruby:
- Instantiating an object from the **Proc** class
- Using **lambdas**
- Using **blocks**

### Writing Methods that take Blocks

Every Ruby method take a block, it can take the optional block as an implicit parameter.

Blocks are passed into a method by using the keyword `yield`

- The yield keyword executes the block.
  - `yield`
  - `yield if block_given?`

### Arguments in methods

The number of arguments at method invocation needs to match the method definition, regardless of whether we are passing in a block.

```ruby
def echo(str)
  str
end

echo
# => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!")
# => "hello!"
echo("hello", "world!")
# => ArgumentError: wrong number of arguments (2 for 1)

# this time, called with an implicit block
echo { puts "world" }
# => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!") { puts "world" }
# => "hello!"
echo("hello", "world!") { puts "world" }
# => ArgumentError: wrong number of arguments (2 for 1)
```

### Arguments in blocks
If you invoke a method that requires a block argument and you don't provide a block, then you will get a `LocalJumError`.

```ruby
def echo_with_yield(str)
  yield
  str
end

echo_with_yield("hello!")
# => LocalJumpError: no block given (yield)
```

### Yielding with a block argument
Sometimes, the block we pass in to a method requires an argument. Note that the block itself is an argument into a method, so the fact that the block requires an argument adds an additional layer of complexity.
```ruby
3.times do |num|
  puts num
end
```
|num| is the block parameter and num is the block variable scoped within the block.

### Arity
Arity, are the rules regarding the number of arguments that are passed to a Block, Proc, or Lambda.

**What would happen if I pass in the wrong number of arguments to a block?**

Blocks don't enforce argument count, unlike normal methods. If a block parameter is not used there will be no issue, it will just evaluate to nil and still execute.

Blocks have loose **arity** rules, which is why it doesn't complain when you pass in different number of arguments; Proc objects and lambdas have different arity rules.

### Return value of yielding to the block
Blocks have a return value, and that return value is based on the last expression in the block. This implies that just like normal methods, blocks can either mutate the argument with a destructive method call or the block can return a value.

**Why use blocks with methods?**
```ruby
alias method_implementation method_definition
alias method_invocation method_call
```
1. Defer some implementation code to method invocation decision.

    If a method does not have a block available, a person invoking the method would have to change the method implementation to added the piece of code that add functionality required.

    If a method does have a block available, a person can invoke the method at the time of invocation with the extra functionality.

    By having block avialable to a method, flexibilty is added to the code when the method is invoked.

2. Methods that need to perform some "before" and "after" actions - sandwich code.

    There will be times when you want to write a generic method that performs some "before" and "after" action. Before and after what? That's exactly the point -- the method implementor doesn't care: before and after anything.

    The question for the method implementor is: what do we fill in for "do something"? The answer is: nothing.

    ```ruby
    def time_it
    time_before = Time.now
    # do something
    time_after= Time.now

    puts "It took #{time_after - time_before} seconds."
    end
    ```

### Methods with an explicit block parameter
Every method, regardless of its definition, takes an implicit block. It may ignore the implicit block, but it still accepts it. However, there are times when you want a method to take an explicit block; you do that by defining a parameter prefixed by an & character in the method definition:

```ruby
def test(&block)
  puts "What's &block? #{block}"
end

test { sleep(1) }
# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil
```
You can see that the &block local variable `sleep(1)` was converted to a Proc:Object, also doesn't have to be name block, can be named whatever, just needs to have the `&`symbol

**Why use an explicit block?**

It provides additional flexibility. Before, we didn't have a handle (a variable) for the implicit block, so we couldn't do much with it except yield to it and test whether a block was provided. Now we have a variable that represents the block, so we can pass the block to another method:

Remeber that once a Block is converted to a Proc, the only way to invoke it use to use the `call` method.

```ruby
def test2(block)
  puts "hello"
  block.call      # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2
```
## Minitest
***
**Keywords**
- Test
  - A situation or contxct in which a test is run.
- Test Suite
  - An entire set of tests for your program/application
- Assertions
  - The verification step that confirms the data returned by your program is what was expected.
***

Minitest that is a Gem that is used to test your Ruby code. An alternative testsuite is Rspec. Minitest uses uses Ruby Syntax while Rspec uses Domain Specific Language (DSL) ie code that reads more like English.

### Assert Style vs Expection Style

Assertion based testing supplies classes that represent test suites. Within each testsuite are methods that define the test cases. Within the method are program code to be tested.
```ruby
class TestSquareRoot < Minitest::Test
  def test_with_a_perfect_square
    assert_equal 3, square_root(9)
  end
  ```

Expection based testing uses Domain Specfic Language(DSL) to describe the test. It pretty much looks like Ruby code.

```ruby
require 'minitest/autorun'

describe 'square_root test case' do
  it 'works with perfect squares' do
    square_root(9).must_equal 3
  end
```

### Basic Test Setup
``` ruby
require 'minitest/autorun'
# ^ gem that will perform the testing of your code.
require_relative '../lib/xyzzy'
# ^ This is the program being tested

require 'simplecov'
# ^ gem that shows how much of the code base is tested by your testsuite
SimpleCov.start
# ^ This is used to start the simplecov program

require "minitest/reporters"
Minitest::Reporters.use!
# ^ This is used to change the minitest report output and added color

class XyzzyTest < Minitest::Test
# Inherits minitest
  def test_the_answer_is_42
    xyzzy = Xyzzy.new
    assert(xyzzy.the_answer == 42, 'the_answer did not return 42')
  end
```
- Create a test file
- Create a test class by subclassing `MiniTest::Test`.
- Create a test by creating an instance method that starts with `test_`
- Create assertions with `assert_equal`, and pass it the expected value and the actual value.
- Colorize Minitest output with `minitest-reporters`
- You can skip tests with `skip`.

### Setup and Teardown
Setup and teardown are methods that are run everytime before/after a test is run. Every time the test is run, its runned in random order.

The Setup method is helpful if we need to keep creating the same object over for each test, instead we would save that object to an instance variable.

The Teardown method is helpful for actions that need to occur once all test are done. A good example of this if Setup opened a file, Teadown woud close it.

### List of assertions
- **assert(arg)**
  - Passes if the argument is truthy.
- **assert_equal(exp, acc)**
  - Passes if the exp value equals the acc value
  - Note: must define an #== method in program to have a basis of comparison.
- **assert_same(obj1, obj2)**
  - Passes if both objects are the same object
- **assert_nil(obj)**
  - Passes if the object returned is nil
- **assert_empty(list)**
  - Passes if the list is empty.
- **assert_include(list, obj)**
  - Passes if the list includes the object
- **assert_match(pattern, obj)**
  - Passes if the string matches the given pattern
- **assert_raise(error, &block)**
  - Passes if the correct error is raised in the executed block
- **assert_instance_of(cls, obj)**
  - Passes if the object is an instance of the class
- **assert_kind_of(cls, object)**
  - Passes if the object is a kind of the class or subclass

### Refutations
We did not go over these but kinda like the opposite of assert, so `refute_equal` is like saying does not equal.

### S.E.A.T Approach
**S** :et up the necessary objects.

**E** :xecute the code against the object we're testing.

**A** :ssert the results of the execution.

**T** :ear down and clean up any lingering artifacts.
