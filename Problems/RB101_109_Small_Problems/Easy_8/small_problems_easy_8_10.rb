# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take non empty string and returns the middle char
  - if odd length return only one char
  - if even length return two chars

Example Test Cases (Implicit Rules):
- blank spaces count as characters

Data Structure:
- Input
  - non empty string comprised of space and alpha chars

- Output
  - return a string - the middle char from input string
    - if odd length return only one char
    - if even length return two chars

Algorithm:
- string count
 -if odd
    length / 2 # this will be the index of the middle char
      string[odd_num]
 -if even
    length / 2 minus 1
      string[even_num, 2] # starting index and return a length of two chars
*******************************************************************************
=end

def center_of(string)
  center_index = string.size / 2
  string.size.odd? ? string[center_index] : string[(center_index - 1), 2]
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
