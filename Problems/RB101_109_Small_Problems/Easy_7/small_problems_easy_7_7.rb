# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take an array of integer and multiply all the numbers together, divide by number of elements and round to 3 decimal places

Example Test Cases (Implicit Rules):
- as of right now no negative numbers
- input is integer output float
- non empty array

Data Structure:
- Input
  - array of integers
- Output
  - float

Algorithm:
- initialize variables
  - first is the product of all integers, will start at 1 first
  - array size to get the number of elements to divide by
- iterate through array
  - multiply each element
using product element divide by array size(make this into a float)
*******************************************************************************
=end

def show_multiplicative_average(array)
  product = 1
  divisor = array.size
  array.each { |num| product *= num }
  p (product / divisor.to_f).round(3)
end

#LS Solution
# def show_multiplicative_average(numbers)
#   product = 1.to_f
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
