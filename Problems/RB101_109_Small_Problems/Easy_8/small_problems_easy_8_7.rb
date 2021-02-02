# Write a method that takes a string, and returns a new string in which every character is doubled.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string and return a string where every character is doubled

Example Test Cases (Implicit Rules):
- the method double everything including all special chars
- does not double an empty string

Data Structure:
- Input
  - string (with any chars)
- Output
  - string with consecutive double chars

Algorithm:
- split string by char
- iterate through array (map)
  - for each char , multiply times 2
- join resulting array
*******************************************************************************
=end

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
