# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string as an argument and return a new string with all the words in reverse order (try not to use reverse method)

Example Test Cases (Implicit Rules): (DO NOT FORGET TO ASK QUESTIONS)
- string made of alpha chars and space
- capitalization doesn't matter
- blank string returns blank string

Data Structure:
- Input
  - string, comprised of words and spaces
- Output
  - string with words in reverse order

Algorithm:
- initialize empty array
- split string
  -which creates an array of words
- rearrange words in string
  this will be done by looping through array and selecting last element from from array, with each iteration the index of the last element will increase by one. each iteration will push the word into the empty array

- return rearranged string

*******************************************************************************
=end

def reverse_sentence (str)
  result = []
  str_arr = str.split(' ')
  arr_size = str_arr.size
  index = 1
  loop do
    break if index > arr_size
    result << str_arr[-index]
    index += 1
  end
  p result.join(" ")
end




# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
