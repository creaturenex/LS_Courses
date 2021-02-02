# Palindromic Strings (Part 2)
# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- given a string as an argument return true or false if string reversed is a palindrome. This method is case insensitive and ignores special chars.

Example Test Cases (Implicit Rules):
- string can be comprised of alpha numeric chars, special chars, and spaces

Data Structure:
- Input
  - string of any chars
- Output
  - true or false if string reverse equals string, without considering space, special chars and capitalization.

Algorithm:
- clean up string for comparison
  downcase everything
  remove space and special char
- clean up string compared to cleaned up string revered

*******************************************************************************
=end

def real_palindrome?(str)
  clean_str = str.downcase.delete "^a-z0-9"
  clean_str == clean_str.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
