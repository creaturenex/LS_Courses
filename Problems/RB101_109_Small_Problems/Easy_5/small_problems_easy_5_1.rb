# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_1.rb

# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

=begin
*******************************************************************************
P-roblem
  Write a method that determines and returns the ASCII string value of a string
  that is passed in as an argument. The ASCII string value is the sum of the
  ASCII values of every character in the string. (You may use String#ord to
  determine the ASCII value of a character.)
  Input:
    - String
  Output:
    - Integer
  Rules:
    Explicit requirements:
      -A String is the argument to the method
      -The ASCII string value is the sum of the ASCII values of every character
       in the string.
      ASCII value of a character

    Implicit requirements:
      -Does every character have a ASCII value?

E-xamples / Test cases
    - ascii_value('Four score') == 984
    - ascii_value('Launch School') == 1251
    - ascii_value('a') == 97
    - ascii_value('') == 0

D-ata Structure
  - Split the string into individual characters
  - iterate through each character to get the ascii value,
  - should have an array with ascii values
  - should find the cumulative sum of all the values in the array

A-lgorithm - How I would solve this?
  -

C - Code
*******************************************************************************
=end

def ascii_value(string)
  if string.emtpy? > 0
    string.chars.map { |char| char.ord }.reduce(:+)
  else
    0
  end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
