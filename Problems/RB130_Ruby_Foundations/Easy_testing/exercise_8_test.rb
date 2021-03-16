=begin
Kind Assertions
Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).
=end

require 'minitest/autorun'
require_relative 'exercise_8'

class Exercise8Test < Minitest::Test
  def test_1
    assert_kind_of Numeric, value
  end
end
