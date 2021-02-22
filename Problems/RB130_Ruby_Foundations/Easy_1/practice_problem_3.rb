# Find Missing Numbers
# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

def missing(array)
  result = []
  p array.each_cons(2) do |first, second|
     p result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# without using block my original

# def missing(array)
#   range = (array.first..array.last).to_a
#   range - array
# end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
