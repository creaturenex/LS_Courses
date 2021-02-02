# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a number as an argument and if positive number return the negative of that num, if the num is less than 0 return orginal number.

Example Test Cases (Implicit Rules):
- looks like we are using integers and not floats
- if integer is positive return negative
- if integer is negative return same num
  if integer is zero

Data Structure:
- Input
  - integer #based on examples
- Output
  - integer positive or negative based on input

Algorithm:
- case statement/ if/else
  if num positive
    then num negative
  else
    num
*******************************************************************************
=end

def negative(num)
  num.positive? ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
