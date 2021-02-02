# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string comprised of different characters and return a string where only the consonant chars are doubled

Example Test Cases (Implicit Rules):
- streing can contain any characters
- emtpy string returns an empty string

Data Structure:
- Input
  - string with any character
- Output
  - string where only the consonant are double
      - any other char is not changed

Algorithm:
- split string into chars
- iterate through array and only transform consonant, anything else remain the same
  - use case statement when consonant, double char
  - else char
- (if map) join the array to return new string

*******************************************************************************
=end

def double_consonants(string)
doubled = string.chars.map do |char|
  case char
  when /[b-df-hj-np-tv-z]+/i
    char * 2
  else
    char
  end
end
doubled.join
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
