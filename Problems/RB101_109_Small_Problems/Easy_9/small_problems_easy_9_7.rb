# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take two integers as an argument first num is the count, second number is start of sequence
  and return an array that contains the same number of elements as count and be multiple of the starting element

Example Test Cases (Implicit Rules):
- if count equal zero return empty array
- only integers, no float
- negative numbers count

Data Structure:
- Input
  - two integers
    - first is the length of array
    - second is the start sequence
- Output
  - an array

Algorithm:
- initialize empty array
- times loop(unitil)
  where x equsls first num
  then for each iteration second num times




*******************************************************************************
=end

def sequence(num1, num2)
result = []
increase = 1
  until increase == num1 + 1
  result << num2 * increase
  increase += 1
  end
result
end




sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
