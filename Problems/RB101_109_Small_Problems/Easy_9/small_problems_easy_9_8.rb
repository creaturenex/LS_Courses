
# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- Take three integers as arguments and return the letter average grade

Example Test Cases (Implicit Rules):
- integers only, no negative num or floats

Data Structure:
- Input
  - three integers
- Output
  - string letter grade associate with average of grade

Algorithm:
- initialize hash with key as letter grade and value as integer range for grade

*******************************************************************************
=end


def get_grade(num1, num2, num3)
  grade = {"A" => (90..100),
           'B' => (80...90),
           'C' => (70...80),
           'D' => (60...70),
           'F' => (0...60)
          }

  mean = (num1 + num2 + num3) / 3
  result = ''
  grade.select { |key, value| result = key if grade[key].include?(mean) }
  result
end

# def get_grade(num1, num2, num3)
#   mean = (num1 + num2 + num3) / 3
#   case mean
#   when (90..100) then 'A'
#   when (80...90) then 'B'
#   when(70...80) then 'C'
#   when(60...70) then 'D'
#   else
#     'F'
#   end
# end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
