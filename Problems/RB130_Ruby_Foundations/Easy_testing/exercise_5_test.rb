=begin
Included Object Assertions
Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
=end

require 'minitest/autorun'
require_relative 'exercise_5'

class Exercise5Test < Minitest::Test
  def test_1
    assert_includes list, 'xyz'
  end
end
