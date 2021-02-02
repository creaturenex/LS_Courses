# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- takea s string and return next to last word

Example Test Cases (Implicit Rules):
- assuming string is a sentence

Data Structure:
- Input
  - string (at least 2 words)
- Output
  - string one word second to least from original

Algorithm:
- split string by space" "(returns array)
  use array index to return second to last element from array

*******************************************************************************
=end

def penultimate(string)
  result = string.split(' ')
  result[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
