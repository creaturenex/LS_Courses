# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_6.rb

# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.



=begin
*******************************************************************************
P-roblem
  Input:
    - two different arrays
  Output:
    - one array that has all unique elements from both arrays
  Rules:
    Explicit requirements:
      - must contain all elements from both array
      - no duplicate elements even if array has duplicate
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - array
  -

A-lgorithm - How I would solve this?
  - concatenate array then filter unique elements

C - Code Below
*******************************************************************************
=end

def merge (ary1, ary2)
  (ary1 + ary2).uniq
end

def merge(array_1, array_2)
  array_1 | array_2 # this is the same as Array#union(ary2)
end

# Example

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
