# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy2_8.rb

# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

operation = ''
sum_value = 0
product_value = 1

puts '>> Please enter an integer greater than 0:'
integer = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."

loop do
  operation = gets.chomp.downcase
  break if operation == 's' || operation =='p'
  puts 'Please type either s for sum or p for product'
end

array = (1..integer).to_a

if operation == 's'
  array.each {|value| sum_value = sum_value + value}
  value = sum_value
else
  array.each {|value| product_value = product_value * value}
  value = product_value
end

puts "The #{operation} of the integers between 1 and #{integer} is #{value}."
