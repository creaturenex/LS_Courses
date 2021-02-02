# Palindromic Strings (Part 1)
# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- Given a string as an argument, return the boolean value true or false if the string is a palindrome, meaning that the word is the same if the letter when reverse return the same word.
-Punctuation and spaces matter

Example Test Cases (Implicit Rules):
- Capitalization matters
- Spaces matter
- special characters matter

Data Structure:
- Input
  - string with alpha chars, up/downcase, spaces and special chars
- Output
  - true/false if string in reverse matches

Algorithm:
- reverse string and compare it to original


*******************************************************************************
=end

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
