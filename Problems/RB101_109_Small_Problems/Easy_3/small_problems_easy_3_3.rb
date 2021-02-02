# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_3.rb

# 24 mins
# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a
# character.

# input:
# Please write word or multiple words: walk
# output:
# There are 4 characters in "walk".

# input:
# Please write word or multiple words: walk, don't run
# output:
# There are 13 characters in "walk, don't run".

puts 'Please write word or multiple words:'
words = gets.chomp
char_count = words.gsub(" ", '').chars.count
prompt "There are #{char_count} characters in #{words}."

# first issue was trying to count a string but kept getting an argument error,
# didn't know how String#count worked even after reading documentation, I ended
# up going to String#chars to create an array and counting from there second
# issue was before I used gsub I was having troubble how to count all character
# except for an empty space. I tried the following

# words.count.each { |char| count if char != " " }

# LS Solution
print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."

# We don't want to count spaces here, so we use String#delete to return a new
# String with all spaces removed from it. The original string stored in input is
# left intact.
