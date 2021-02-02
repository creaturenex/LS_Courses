# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_9.rb

# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
# integer_to_string from the previous exercise.

# Examples
# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

=begin
*******************************************************************************
P - [Understand the] Problem
  Write a method that takes a positive or negative integer or zero, and
  converts it to a string representation.
  Input:
    Integer (positive or negative)
  Output:
    Numeric String (positive or negative)
  Rules:
    Explicit requirements:
      CANNOT use Integer#to_s, String(), Kernel#format,
      CAN use Method#integer_to_string I created
    Implicit requirements:
      if number is positive then numeric string must have "+" character
      0 has no "+/-" so no symbol
      no floats!

E - Examples / Test cases
  signed_integer_to_string(4321) == '+4321'
  signed_integer_to_string(-123) == '-123'
  signed_integer_to_string(0) == '0'

D - Data Structure
  How identify postive or negative #
    use case statement to convert positive/negative/zero numbers
      num > 0
      num < 0
      num = 0
    If number is postive,
      run previous method and contcat "+"
    If number is negative,
      change to postive, run previous method and concat "-"
    If number is zero
      run previous method only

From previous method
  - Split number into into a digits arrays ***chars = digits**
  - Interate through each digit in the array and compare it to Constant Variable
  - Map the value of the Constant Varible[digit] which is the numeric string
  - Join the resulting array so we only have one string

A - Algorithm - How I would solve this?
  -

C - Code
*******************************************************************************
=end

NUMBERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  number.digits.reverse.map { |num| NUMBERS[num] }.join
end

def signed_integer_to_string(number)
  case number
  when number > 0
    "+" + integer_to_string(number)
  when number < 0
    "-" + integer_to_string(-number)
  else
    integer_to_string(number)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
