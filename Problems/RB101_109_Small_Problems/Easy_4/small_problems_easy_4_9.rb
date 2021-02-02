# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_9.rb

# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do
# this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

# Examples
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

=begin
P - [Understand the] Problem
  Write a method that takes a positive integer or zero, and converts it to a
  string representation.
  Input:
    Integer
  Output:
    Numeric String
  Rules:
    Explicit requirements:
      CANNOT use Integer#to_s, String(), Kernel#format,
    Implicit requirements:

E - Examples / Test cases
  # integer_to_string(4321) == '4321'
  # integer_to_string(0) == '0'
  # integer_to_string(5000) == '5000'

D - Data Structure
  - Split number into into a digits arrays ***chars = digits**
  - Interate through each digit in the array and compare it to Constant Variable
  - Map the value of the Constant Varible[digit] which is the numeric string
  - Join the resulting array so we only have one string

A - Algorithm - How I would solve this?
  - =Split digits up and iterate through each digits to output numeric strings

C - Code
=end

NUMBERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  number.digits.reverse.map { |num| NUMBERS[num] }.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
