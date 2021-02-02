# Practice Problem 12

# Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}


=begin
*******************************************************************************
P-roblem
  Input:
    - array with sub array and hashes
  Output:
    - hash
      - where first item in sub array is key and second item is value
  Rules:
    Explicit requirements:
      - cannot use to_h method
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  -
  -

A-lgorithm - How I would solve this?
  -

C - Code Below
*******************************************************************************
=end

hash = {}
arr.each do |array|
  hash[array[0]] = array[1]
end

p hash

# # Launch School Solution

# hsh = {}
# arr.each do |item|
#   hsh[item[0]] = item[1]
# end

# hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# Although this task may at first seem complicated because the collection contains different object types, sometimes nested three levels deep, you only really have to work at the initial sub-level in order to reach a solution. Remember that any Ruby object can be a hash key and any Ruby object can be a hash value.
