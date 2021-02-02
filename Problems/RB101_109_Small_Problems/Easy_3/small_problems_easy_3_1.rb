# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_1.rb

# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5
# numbers.

# Examples:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

numbers = []

def prompt(string)
  puts "==> #{string}"
end

def last_num(numbers)
  if numbers[0..4].include?(numbers[5])
    prompt "The number #{numbers[5]} appears in #{numbers[0, 5]}"
  else
    prompt "The number #{numbers[5]} does not appears in #{numbers[0, 5]}"
  end
end

prompt("Please enter six random numbers when prompted.")
prompt("Enter the 1st number:")
numbers << gets.chomp.to_i
prompt("Enter the 2nd number:")
numbers << gets.chomp.to_i
prompt("Enter the 3rd number:")
numbers << gets.chomp.to_i
prompt("Enter the 4th number:")
numbers << gets.chomp.to_i
prompt("Enter the 5th number:")
numbers << gets.chomp.to_i
prompt("Enter the 6th number:")
numbers << gets.chomp.to_i

last_num(numbers)

# LS solution - simple solution
# the directions doesnt say the last number is part of the 1st five numbers
numbers = []

puts "Enter the 1st number:"
numbers << gets.chomp.to_i
puts "Enter the 2nd number:"
numbers << gets.chomp.to_i
puts "Enter the 3rd number:"
numbers << gets.chomp.to_i
puts "Enter the 4th number:"
numbers << gets.chomp.to_i
puts "Enter the 5th number:"
numbers << gets.chomp.to_i
puts "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
