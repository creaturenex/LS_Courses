# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_7.rb

# The String#to_i method converts a string of numeric characters (including an
# optional plus or minus sign) to an Integer. String#to_i and the Integer
# constructor (Integer()) behave similarly. In this exercise, you will create a
# method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. Your method should do this the old-
# fashioned way and calculate the result by analyzing the characters in the
# string.

# Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570

def string_to_integer(str_num)
  numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  str_num.chars.map { |num| numbers.index(num) }.reduce { |start, i| start * 10 + i }
end


Further Exploration
Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

Example:

hexadecimal_to_integer('4D9f') == 19871
