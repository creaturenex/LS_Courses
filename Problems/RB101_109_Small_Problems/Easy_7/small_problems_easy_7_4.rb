# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- Take a string return a new string that replaces every character with it opposite case ie if uppercase become comes downcase and vise versa.
- This change does not apply to non alpha characters

Example Test Cases (Implicit Rules):
- inverse case
- does not apply to non alpha chars

Data Structure:
- Input
  - string
- Output
  - string with inverse case

Algorithm:
- split string into chars (#chars) as save as variable
- iterate though array
  - use each/map method
    - use if/else statement
- join resulting array

*******************************************************************************
=end


def swapcase(string)
  chars_arr = string.chars
  swapcase = chars_arr.map do|char|
    if char == char.upcase
      char.downcase
    else
      char.upcase
    end
  end
  p swapcase.join
end

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
