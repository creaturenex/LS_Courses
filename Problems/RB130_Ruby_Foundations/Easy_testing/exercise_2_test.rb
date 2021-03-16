=begin
Equality Assertions
Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
=end

require 'minitest/autorun'
require_relative 'exercise_2'

class Exercise2Test < Minitest::Test
  def test_1
    assert_equal 'xyz', value.downcase
  end
end
