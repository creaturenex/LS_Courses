# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_8.rb

# Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

=begin
*******************************************************************************
P-roblem
  Input:
    - array -unordered list with one value that is a duplicate
  Output:
    - value that is a duplicate
  Rules:
    Explicit requirements:
      - return only duplicate values
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - array
  -

A-lgorithm - How I would solve this?
  - use array.uniq minus array to get uniq value this method does not work similar to delete will remove all matching values

  iterate through array
    initial first value
    if n-1 = n return n
    else
      next

C - Code Below
*******************************************************************************
=end

def find_dup(ary)
  single_num = []
  ary.find do |num|
    if single_num.include?(num) == false
      single_num << num
    else
      dup = num
    end
  p dup
  end
end

# def find_dup(array)
#   array.find { |element| array.count(element) == 2 }
# end

# p find_dup([1, 5, 3, 1]) == 1

p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
  38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
  14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
  78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
  89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
  41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
  55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
  85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
  40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
  7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
