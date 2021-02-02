# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- takes an array of integers and returns the sum of the sum for that array

Example Test Cases (Implicit Rules):
- will contain at least one integer
- based on examples will be positive

Data Structure:
- Input
  - array of integer
- Output
  - integer

Algorithm:
- initialized variable with the value of zero
- iterate through array
  - each with index
    push sum of each slice
- return sum


*******************************************************************************
=end
def sum_of_sums(array)
  sum = 0
  array.each_with_index { |_, index| sum += array[0..index].sum }
  sum
end



p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
