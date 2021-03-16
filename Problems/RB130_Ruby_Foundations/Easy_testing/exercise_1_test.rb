=begin
Boolean Assertions
Write a minitest assertion that will fail if the value.odd? is not true
=end

require 'minitest/autorun'
require_relative 'exercise_1'

class Exercise1Test < Minitest::Test
  def test_1
    assert_equals true, value.odd?
  end
end
