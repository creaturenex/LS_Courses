=begin
Exception Assertions
Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
=end

require 'minitest/autorun'
require_relative 'exercise_6'

class Exercise6Test < Minitest::Test
  def test_1
    assert_raises NoExperienceError do
      exmployee.hire
      end
    end
  end
end
