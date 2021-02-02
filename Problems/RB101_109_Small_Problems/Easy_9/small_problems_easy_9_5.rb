# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string as an argument and return an array that contains every word from string and add a space and word length

Example Test Cases (Implicit Rules):
- non alpha chars count in word length
- space are not counted

Data Structure:
- Input
  - string of alpha non numeric chars
- Output
  - array of string
   each element is the word from string and has addtional space and word count

Algorithm:
- initialize empty array
- split string by space which creates a new array
- iterate through array
  -for each element push element + " " + element.count.to_i
- return filled array


*******************************************************************************
=end

def word_lengths(string)
  string.split(' ').map { |word| word + ' ' + word.length.to_s}
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
