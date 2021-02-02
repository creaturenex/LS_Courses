# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_8.rb

# In the previous exercise, you developed a method that converts simple numeric
# strings to Integers. In this exercise, you're going to extend that method to
# work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading + or - sign; if the first
# character is a +, your method should return a positive number; if it is a -,
# your method should return a negative number. If no sign is given, you should
# return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. You may, however, use the
# string_to_integer method from the previous lesson.

# Examples
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

=begin
P - [Understand the] Problem
  Input:
    etc
  Output:
    etc
  Rules:
    Explicit requirements:

    Implicit requirements:

E - Examples / Test cases

D - Data Structure
  What data to use? ie array hash etc

A - Algorithm
  Walk through How I would solve this?

C - Code
*******************************************************************************
P -
  Write a method that takes a numeric String , and returns the appropriate
  number as an integer.

  Input:
    String - The String may have a leading + or - sign;
  Output:
    Integers (+/-)
  Rules:
    Explicit requirements:
      If the first character is a +, your method should return a positive number
      If it is a -, your method should return a negative number.
      If no sign is given, you should return a positive number.
      The string will always contain a valid number.
      CANNOT String#to_i, Integer(), etc.
      You may, however, use the string_to_integer method from the previous
      lesson.
    Implicit requirements:
      ? the +/- characters will be a string
E - Exanples
  string_to_signed_integer('4321') == 4321
  string_to_signed_integer('-570') == -570
  string_to_signed_integer('+100') == 100

D - ata
  if no sign make a postive number hence the else statement # for now

  I need to see if string contains plus or minutes
    if - character make number negative
    if + character make number postive
      if it does include delete character before string_to_integer method

  the string_to_integer method does not change

  search string for (+/-)


A

C
=end

NUMBERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def string_to_integer(str_num)
  str_num.chars.map { |num| Numbers.index(num) }.reduce { |start, i|
    start * 10 + i }
end

def string_to_signed_integer(str_num)
  if str_num.include?("+")
    num_modified = str_num.delete("+")
    string_to_integer(num_modified)
  elsif str_num.include?("-")
    num_modified = str_num.delete("-")
    -(string_to_integer(num_modified))
  else # if no sign
    string_to_integer(str_num)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
