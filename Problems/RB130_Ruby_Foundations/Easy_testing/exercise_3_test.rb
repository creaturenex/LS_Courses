=begin
Nil Assertions
Write a minitest assertion that will fail if value is not nil.
=end

require 'minitest/autorun'
require_relative 'exercise_3'

class Exercise3Test < Minitest::Test
  def test_1
    asserts_nil value
  end
end
