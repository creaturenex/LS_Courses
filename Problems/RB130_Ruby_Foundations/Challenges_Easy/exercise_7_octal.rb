class Octal
  attr_accessor :num

  def initialize(num)
    @num = num.to_i.digits
  end

  def to_decimal
    sum = []
    p num
    num.each_with_index { |digi, idx| digi >= 8 ? 0 : sum << digi * (8**idx) }
    sum.sum
  end
end

=begin
Finished in 0.001800s, 8331.0515 runs/s, 8331.0515 assertions/s.

  1) Failure:
OctalTest#test_6789_is_seen_as_invalid_and_returns_0 [/home/oscar/LaunchSchool/LS_Courses/Problems/RB130_Ruby_Foundations/Challenges_Easy/exercise_7_octal_test.rb:61]:
Expected: 0
  Actual: 3520

  2) Failure:
OctalTest#test_234abc_is_seen_as_invalid_and_returns_0 [/home/oscar/LaunchSchool/LS_Courses/Problems/RB130_Ruby_Foundations/Challenges_Easy/exercise_7_octal_test.rb:76]:
Expected: 0
  Actual: 156

=end
