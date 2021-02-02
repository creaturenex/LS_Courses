puts "This a Calculator Program"

puts "Give me a number"
first_num = gets.chomp.to_i

puts "Give me an addtional number"
second_num = gets.chomp.to_i

puts "What type of operation do you want to perform: add, subtract, multiply or divide?"
operation = gets.chomp

operator = ["add", "subtract", "multiply", "divide"]

if operation == operator[0]
  puts first_num + second_num
elsif operation == operator[1]
  puts first_num - second_num
elsif operation == operator[2]
  puts first_num * second_num
elsif operation == operator[3]
  puts first_num / second_num
end
