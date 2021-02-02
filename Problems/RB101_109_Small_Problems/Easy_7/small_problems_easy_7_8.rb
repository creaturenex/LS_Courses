# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take two array, that both contain list of numbers, return a single array that are the product of both array at each index

Example Test Cases (Implicit Rules):
- arrays the same size

Data Structure:
- Input
  - two arrays of integers
- Output
  - one array, where product of both array at the same index

Algorithm:
- initialize new empty array
  - to store product of array
itterate through array and push result to new array



*******************************************************************************
=end

def multiply_list (arr1, arr2)
  product = []
  arr1.each_with_index do |num, index|
    product << num * arr2[index]
  end
  p product
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
