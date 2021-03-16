=begin
Empty Object Assertions
Write a minitest assertion that will fail if the Array list is not empty.
=end

require 'minitest/autorun'
require_relative 'exercise_4'

class Exercise4Test < Minitest::Test
  def test_1
    assert_empty array
  end
end
