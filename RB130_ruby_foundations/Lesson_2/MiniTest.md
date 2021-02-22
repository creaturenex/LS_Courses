# MiniTest
**Minitest** is the default testing library that comes with Ruby. **RSpec is another testing library that reads like natural english. Rspec is called a Domain Specific Language (DSL).

MiniTest reads like normal Ruby code without a lot of syntax, its not a DSL, it's just plain Ruby.

**Test Suite**
- The entire set of tests that accompanies your program/application, ie all the test for the project.

**Test**
- The situation or context in which the test are run. You can have multiple assertions in a test.

**Assertion**
- The verification step to confirm the data returned by your program/application is what was expected.

## Assertions



## Seat Approach
As you read the tests from previous lessons, you might have noticed that we have to set up the car object within each test in order to perform some assertion on it. This seems a little redundant; it would be more optimal to do some set up once outside of each test, then just run the assertions on it. This may seem like a minor and unnecessary performance savings, but the savings really add up if you have a lot of tests and if the set up process is expensive (say you're retrieving some data from a database).

In the previous assignments, we've been quickly diving down into the tests and assertions, but in larger projects, there are usually 4 steps to writing a test:

Set up the necessary objects.
Execute the code against the object we're testing.
Assert the results of the execution.
Tear down and clean up any lingering artifacts.
This is the SEAT approach. In our simple tests, we've been doing steps 2 and 3, and we haven't had the need to set up anything or perform any clean up or tear down.

Let's take a look at our example.

## Testing Equality

Testing equality
use an Equality test

assert_equals = the values are the same

assery_same = are objects the same object ie object_id
```ruby
require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end
```


Add the list of common assert methods


All Ruby core classes include the `#==` method so as a result `assest_equal`
will work without issue. If we have a custom class then we must define a `#==`
instance method to compare both objects. It must be defined so Ruby know what
 exactly to compare.


assert_equals(arg1 , arg2)
assert_same

assert_raises(error type) {block, code that will case an error}
