# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_2.rb

# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power.
# Do not worry about validating the input.

# Example
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

def prompt(message)
  puts "==> #{message}"
end

def math_operations(number1, number2)
  prompt("#{number_1} + #{number_2} = #{number_1 + number_2}")
  prompt("#{number_1} - #{number_2} = #{number_1 - number_2}")
  prompt("#{number_1} * #{number_2} = #{number_1 * number_2}")
  prompt("#{number_1} / #{number_2} = #{number_1 / number_2}")
  prompt("#{number_1} % #{number_2} = #{number_1 % number_2}")
  prompt("#{number_1} ** #{number_2} = #{number_1**number_2}")
end

prompt("Please type two numbers")
prompt("Enter the first number")
num1 = gets.chomp.to_i
prompt("Enter the second number")
num2 = gets.chomp.to_i

math_operations(num1, num2)

# What if we wanted to use the number 0
# I assumed zero was not a valid input as problem said two positive integers.
# If we tried to divide by zero would get an error as zero can not be a
# demoninator.

# What if we wanted to use floats instead of integers?
# How does this change this problem?

# ran code with String#to_f.
# The division operation is now more accurate as there is no rounding to
# nearest interger.
# The exponenent operation is now expressed in scientific notation
# ie 23 / 17 = 1 vs 23.0 / 17.0 = 1.3529411764705883

# LS Solution
# def prompt(message)
#   puts "==> #{message}"
# end

# prompt("Enter the first number:")
# first_number = gets.chomp.to_i
# prompt("Enter the second number:")
# second_number = gets.chomp.to_i

# prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
# prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
# prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
# prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
# prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
# prompt("#{first_number} ** #{second_number} = #{first_number**second_number}")

# Discussion
# There are some edge cases to consider in this exercise. We have to be careful
# of not having a second number that is zero. What if we wanted to use floats
# instead of integers? How does this change this problem?
