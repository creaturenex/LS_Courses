# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_1.rb

# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

3.times {puts 'Hello a'}

# Conditional loop, conditional check happens before code gets executed.
a = 3
loop do
  a -= 1
  puts "Hello b"
  break if a == 0
end

# Do/While loop, conditional check happens after code gets executed.
a = 3
loop do
  puts "Hello c"
  a -= 1
  break if a == 0
end

a = 3
loop do
  puts "Hello d"
  a -= 1
  if a == 0
    break
  end
end

# block 1
(1..3).each {|i| puts "Hello e"}

# block 2
(1..3).each do |i|
  puts "Hello f"
end

# While, evaluted code while statement is true.
c = 0
while c < 3
  puts "Hello g"
  c += 1
end

# Until, evalutes code WHILE statement is false or UNTIL the statement is true.
d = 0
until d == 3
  puts "Hello h"
  d += 1
end
