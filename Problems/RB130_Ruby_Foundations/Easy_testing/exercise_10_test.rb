=begin
Refutations
Write a test that will fail if 'xyz' is one of the elements in the Array list:
=end
 require 'minitest/autorun'
 require_relative 'exercise_10'

 class Exercise10Test < Minitest::Test
  def test_1
    refute_includes 'xyz', list
  end
end
