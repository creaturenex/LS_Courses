# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_5.rb

# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

=begin
*******************************************************************************
P-roblem
  Input:
    - Array
  Output:
    - Array, with elements in reverse order
  Rules:
    Explicit requirements:
      - Do not modify original array
      - Do not use Array#reverse or reverse!
      - Can not use previous method
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - array both input and output

A-lgorithm - How I would solve this?
  - create empty array
  iterate through array in reverse and push value into new array
  - use a counter variable that will be increase/decrease each iteration
  -return new array

C - Code Below
*******************************************************************************
=end

def reverse(ary)
  reverse_ary = []
  index = 1
  until index > ary.size
    reverse_ary << ary.fetch(-index)
    index += 1
  end
  reverse_ary
end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

p list = [1, 3, 2]
p list.object_id                  # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
p list.object_id
