# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_4.rb

# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# Examples:

# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1]
# list == [4, 3, 2, 1]
# list.object_id == result.object_id

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"]
# list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# reverse!(list) == ["abc"]
# list == ["abc"]

# list = []
# reverse!(list) == []
# list == []

=begin
*******************************************************************************
P-roblem
  Input:
    - array
  Output:
    - array with element in reverse position in element
  Rules:
    Explicit requirements:
      - can not use Array#reverse or reverse!
      - the method must mutate the original array! so when I call it after the method it will be different
      - the original array must be the same object
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - array
  -

A-lgorithm - How I would solve this?
  - find array size
  - create empty array
  - create variable called index that start at -(1)
  - loop through array by working back words until we reach the original array size
  -
  - I would call the last item in the original array and push it into a new empty array

C - Code Below
*******************************************************************************
=end

def reverse!(list)
  reverse_list = []
  index = -1
  until index == -(list.size + 1)
    reverse_list << list[index]
    index -= 1
  end
  list.replace(reverse_list)
end

# Launch School Solution

# def reverse!(array)
#   left_index = 0
#   right_index = -1

#   while left_index < array.size / 2
#     array[left_index], array[right_index] = array[right_index], array[left_index]
#     left_index += 1
#     right_index -= 1
#   end

#   array
# end


list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
p list == ["abc"]

list = []
reverse!(list) == []
p list == []
