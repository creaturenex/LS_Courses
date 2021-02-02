# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_7.rb

# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

=begin
*******************************************************************************
P-roblem
  Input:
    - one array

  Output:
    - two arrays
      - array is split in half with larger size in first array if array size odd or equal size
  Rules:
    Explicit requirements:
      - return two nest array arrays
        if original array.size is even split into two even array
        if originbal array size odd split larger half into first ary and second array is last
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - arrays
  -

A-lgorithm - How I would solve this?
  - I need to get the array size first to know if even or odd
    - if even split array evenly
        - first half in a variable
          - use Array# first(array.size/2)
        - second half in a varible
          - use Array#last(array.size/2)

    - if odd split larger size
      - first = (array.size - array.size/2)
      - last = ary.size/2

C - Code Below
*******************************************************************************
=end

def halvsies(ary)
  half = []
  if ary.size.even?
    half << ary.first(ary.size / 2)
    half << ary.last(ary.size / 2)
  else
    half << ary.first(ary.size - (ary.size / 2))
    half << ary.last(ary.size / 2)
  end
  half
end

# Launch School Solution

# def halvsies(array)
#   middle = (array.size / 2.0).ceil
#   first_half = array.slice(0, middle)
#   second_half = array.slice(middle, array.size - middle)
#   [first_half, second_half]
# end

# Examples

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
