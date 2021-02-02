# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_6.rb

# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

def running_total(array)
  sum = 0
  new_array = array.map { |value| sum += value }
end

# LS Solution
def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

# Further Exploration
# Try solving this problem using Enumerable#each_with_object or
# Enumerable#inject (note that Enumerable methods can be applied to Arrays).

def running_total(array)
  sum = 0
  array.each_with_object ([]) { |value, array| array << sum += value }
end
