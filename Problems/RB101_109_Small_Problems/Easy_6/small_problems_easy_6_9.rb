# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_9.rb

# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

=begin
*******************************************************************************
P-roblem
  Input:
    - array, element as parameters
  Output:
    - boolean true/false if element/parameter is in the array
  Rules:
    Explicit requirements:
      - Cannot use Array#include?
      - must return true or false if element is in array
    Implicit requirements:
      - data can be anything because we just want to know if it is in the array
      -

E-xamples / Test cases Below

D-ata Structure
  - array
  -

A-lgorithm - How I would solve this?
  - first I would define the method with two parameter first para = array and second para = search
  - second I would create an empty array inside the method
  - third I will iterate through each element and do a boolean comparison

C - Code Below
*******************************************************************************
=end

# def include?(array, search_val)
#   if array.empty?
#     false
#   else
#   array.find { |element| element == search_val} == search_val
#   end
# end

def include?(array, search_val)
  array.any? { |element| element == search_val}
end



p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
