# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string a return a string with alternating chars upcase downcase
- chars that are not letter should not be changed, but count as chars when swapping

Example Test Cases (Implicit Rules):
- first letter is always upcase


Data Structure:
- Input
  - string
- Output
  - string with laternating chars

Algorithm:
- create array of chars to iterate through
- iterate through string with index?
    - if even index.upcase
    - if odd index downcase
return new array. and join
*******************************************************************************
=end

def staggered_case(string)
  chars_arr = string.chars
  staggered_chars = []
  chars_arr.each_with_index do |char, index|
    if index.even?
      staggered_chars << char.upcase
    else
      staggered_chars << char.downcase
    end
  end
  staggered_chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
