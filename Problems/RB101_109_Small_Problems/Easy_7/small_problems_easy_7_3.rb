# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string that returns a string with every word, that the first letter is capitalized, and all following letters are lowercase.

Example Test Cases (Implicit Rules):
- the string will be a quote.
  - if there is a quote, that string inside the quote does not get capitalized.

Data Structure:
- Input
  - string
- Output
  - string with first letter of a word capitalized and other letters downcase
    - if string has quotes do not modify.

Algorithm:
clean up string (#chars)
- split string by words and save to variable

identify quote (#each_with_index)
  -iterate through array
    - if word contain "/"", save index to variable
    - this will be repeated for closing quote
  - slice from array using the index from start..end

transform non quote words (map)
- if word is not in the slice range, capitalized word

join resulting array

return new array





get individual words




*******************************************************************************
=end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
