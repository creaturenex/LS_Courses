# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy2_4.rb

# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!


# Example:
require 'date'

puts 'What is your age?'
age = gets.chomp.to_i

puts 'At what age would you like to retire?'
age_retire = gets.chomp.to_i

years_working = age_retire - age
year_current = Date.today.year
year_retiring = Date.new(year_current + years_working).year

puts "It's #{year_current}. You will retire in #{year_retiring}."

puts "You have only #{years_working} years of work to go!"
