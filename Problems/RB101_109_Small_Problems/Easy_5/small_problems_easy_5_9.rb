# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_9.rb

# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

=begin
*******************************************************************************
P-roblem
  Input:
    - an Array of integer (range)
  Output:
    - an Array of integers that have been sorted alphabetically by word version of the number
  Rules:
    Explicit requirements:
      -
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - have an array of words for the numbers, depending on its index location matches number range as range is 0-19
  - sort the word number array
   - if the value in the sorted array matches the value in the number array, put the index into an empty array?
  -

A-lgorithm - How I would solve this?
  -

C - Code Below
*******************************************************************************
=end

def alphabetic_number_sort(num_ary)
  word_num = ["zero", "one", "two", "three", "four", "five", "six", "seven",
              "eight", "nine", "ten", "eleven", "twelve", "thirteen",
              "fourteen", "fifteen", "sixteen", "seventeen", "eighteen",
              "nineteen"]

  sorted_num_ary = []
  word_num.sort.each { |word, index| sorted_num_ary << word_num.index(word) }
  sorted_num_ary
end

# Launch School Solution

# NUMBER_WORDS = %w(zero one two three four
#   five six seven eight nine
#   ten eleven twelve thirteen fourteen
#   fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(numbers)
# numbers.sort_by { |number| NUMBER_WORDS[number] }
# end

=begin
Improvements
I could have made this variable a constant as it never changes and as a constant the method has access to that variable.

remember that I can write an array of strings as
%w(string1 string2 string3 etc) notice no commas

=end

# Examples:
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
