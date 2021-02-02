# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- Given a string, containing more than one word, return the given string with words that are longer than 5 letters, reversed.

Example Test Cases (Implicit Rules):
- location of words remain the same in the string , only the letters in the words are reverse if greater than 5 letters.
- Capitilization of letter remains

Data Structure:
- Input
  - string with alpha chars and space, ie words
- Output
  - string with words longer than 5 letter in reverse order

Algorithm:
- initialize empty array
- first split into words
- iterate through words
  - if word is greater than 5 letter
    - push word reverse to new array
  - else
    - push word to new array
  end
join new array to return string

*******************************************************************************
=end

def reverse_words(str)
  result = []
  str_arr = str.split(' ')
  str_arr.each do |word|
    if word.size >= 5
      result << word.reverse
    else
      result << word
    end
  end
  result.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
