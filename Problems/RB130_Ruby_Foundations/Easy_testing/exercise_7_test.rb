=begin
Type Assertions
Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.
=end

require 'minitest/autorun'
require_relative 'exercise_7'

class Exercise7Test < Minitest::Test
  def test_1
    assert_instance_of Numeric, value
  end
end
