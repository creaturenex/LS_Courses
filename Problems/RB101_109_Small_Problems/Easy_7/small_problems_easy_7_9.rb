# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- takes two arrays of integers and return a new array of numbers

Example Test Cases (Implicit Rules):
- new array size is the product of both array sizes

Data Structure:
- Input
  - two array of integers, can be different sizes
- Output
  - one array comprised of all the multiples of the products of each elements

Algorithm:
- iterate through arr and multiple elements, no need for to iniialize vairiable the map block will reture the final array
*******************************************************************************
=end

def multiply_all_pairs(arr1, arr2)
  result = arr1.map do |num1|
    arr2.map do |num2|
      num1 * num2
    end
  end
  p result.flatten.sort
end




p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
