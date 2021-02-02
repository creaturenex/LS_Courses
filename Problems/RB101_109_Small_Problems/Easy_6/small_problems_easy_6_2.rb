# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_2.rb

# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

=begin
*******************************************************************************
P-roblem
  Input:
    - Array
      -strings
  Output:
    - Array
      - same string with vowels removed
  Rules:
    Explicit requirements:
      - return same string with remove(a, e, i, o, u) chars from string
      - return array
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - array in and out

A-lgorithm - How I would solve this?
  - create empty array for modified elements
  - iterate through each element in array
  - for each element use String#delete "aeiou"
    - make sure to account for up/downcase
    - returns original string with objects deleted
    - push result into array

C - Code Below
*******************************************************************************
=end
VOWELS = "aeiouAEIOU"

def remove_vowels(str_ary)
  no_vowels = []
  str_ary.each { |element| no_vowels << element.delete(VOWELS) }
  no_vowels
end

# Launch School Solution

# def remove_vowels(strings)
#   strings.map { |string| string.delete('aeiouAEIOU') }
# end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
