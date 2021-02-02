# # Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a an array (of fruit and item numbers) and return an array with correct number of items (fruits)

Example Test Cases (Implicit Rules):
- based on example fruit are string, and number of fruit are integers
- no negative numbers or empty array
-

Data Structure:
- Input
  - nest array of string and integers
- Output
  - a single array of string

Algorithm:
- intialized empty array
- iterate through array
  - for each element times loop
  index 1 = times and index 0 is what will be transformed, each time it gets pushed into variuaible
*******************************************************************************
=end

def buy_fruit(array)
  result = []
  array.each { |arr| arr[1].times{ result << arr[0]}}
  result
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

