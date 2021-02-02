# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take an array and return an array where the first element has been added to the end of the array.
- The original array can not be transformed
- Cannot use the rotate method

Example Test Cases (Implicit Rules):
- array can be any element ie numeric or string
- cna be as small as 1 element

Data Structure:
- Input
  - array of either string or numeric
- Output
  - array of original with 1st element is now last

Algorithm:
- clone array
- ap
*******************************************************************************
=end

def rotate_array(array)
cloned_arr = array.clone
cloned_arr << cloned_arr.delete_at(0)
cloned_arr
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
