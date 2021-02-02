# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy2_5.rb

# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# Examples

# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?


puts 'What is your name?'

name = gets.chomp

if /!/.match(name)
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end

# name[-1] == '!' also works as we assume the last character in the string is !

# 'Try modifying our solution to use String.chomp! and String.chop!, respectively.'

# .chop method
# chop removes the last character in a string.
