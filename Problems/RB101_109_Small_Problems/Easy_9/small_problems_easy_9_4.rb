# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take an integer as an argument and return an Array of all integers, in order between 1 and argument

Example Test Cases (Implicit Rules):
- only one number provided
- number is integer
- no negative numbers

Data Structure:
- Input
  - integer
- Output
  - array of integers

Algorithm:
- return integer range
  - intilize a range  with starting value at 1 and ending value at num
*******************************************************************************
=end


def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
