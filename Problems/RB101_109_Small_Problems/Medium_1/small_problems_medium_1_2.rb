# Write a method that can rotate the last n digits of a number. For example:

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take two integers as an argument and return the first integer with the last digits (2nd num) are rotated.

Example Test Cases (Implicit Rules):
- only positive num
- no float
- does not sat if original is modified or not

Data Structure:
- Input
  - two integers
    - first num is the number to be modified
    - second num is the last "n" digits to be modified
- Output
  - one integer with he last n digits rotated

Algorithm:
- split integer by digits into array
- slice the array to two parts
  -first half is unmodified num digits
  - second half is rotated section based on second argument


*******************************************************************************
=end
def rotate_rightmost_digits(num1, num2)
  num_digits = num1.digits.reverse
  unchanged_num =  num_digits[0..(-num2-1)]
  changed_num = num_digits[-num2..-1]
  changed_num << changed_num.delete_at(-num2)
  (unchanged_num + changed_num).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
