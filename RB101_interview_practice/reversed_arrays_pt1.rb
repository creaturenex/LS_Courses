# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take an array as an argument and return the original array, with the elements in reverse order

Example Test Cases (Implicit Rules):
- array can be made of integers or string chars
- array can be empty or contain only one element

Data Structure:
- Input
  - array, with elements comprised of strings or integers
- Output
  - original array with elements in reverse order

Algorithm:
- reverse elements in original array (mutate array)
   1.upto(arr.size)
    array.unshift(array.pop)
end
*******************************************************************************
=end

def reversed!(arr)
  rev_arr = []
  1.upto(arr.size) { |num| rev_arr << arr[-num] }
  rev_arr.each_with_index { |ele, idx| arr[idx] = ele }
  arr
end

p list = [1,2,3,4]
p result = reversed!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

# list = %w(a b e d c)
# p reversed!(list) == ["c", "d", "e", "b", "a"]
# list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# reverse!(list) == ["abc"]
# list == ["abc"]

# list = []
# reverse!(list) == []
# list == []
