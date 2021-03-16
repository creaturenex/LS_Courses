=begin
Same Object Assertions
Write a test that will fail if list and the return value of list.process are different objects.
=end

require 'minitest/autorun'
require_relative 'exercise_9'

class Exercise9Test < Minitest::Test
  def test_1
    assert_same list, list.process
  end
end
