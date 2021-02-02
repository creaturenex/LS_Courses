# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.



=begin
*******************************************************************************
P-roblem
  Input:
    - two different arrays that are the same size
  Output:
    - one array that has the corresponding element in alternating order from the previous two arrays
  Rules:
    Explicit requirements:
      - return a new single array comprised of two previous elements
      - elements must be in alternating order
      -
    Implicit requirements:
      - new array size should be the cumulative size of both array
      - two parameter in method definition
      - elements can be any data structure

E-xamples / Test cases Below

D-ata Structure
  -
  -

A-lgorithm - How I would solve this?
  -

C - Code Below
*******************************************************************************
=end


def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |ele, index|
    new_arr << ele
    new_arr << arr2[index]
  end
  new_arr
end

=begin LS Solution
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end
=end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=begin
On `lines 38-45` the method . The method is define to require two parameter, which are arrays.

on line 39 the variable new_arr is initialized as an empty array inside the method definition. As a result is only has an inner scope within the method.

online 40 the method each_with_index is called and do/end
=end
