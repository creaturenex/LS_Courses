# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string and return an array with all the possible substring possible

Example Test Cases (Implicit Rules):
- the only input is a string comprised of alpha chars

Data Structure:
- Input
  - string of alpha chars
- Output
  - an array comprised of all possible substring ordered by orginal string index

Algorithm:
- initialize empty array
- split string by char
- iterate through array
  - each with index
    at each iteration
      loop slice at index until end of array
      each loop will mov

*******************************************************************************
=end




def substrings(string)
  result = []
  str_arr = string.chars
  str_arr.each_with_index do |_, index|
    length = 1
    arr_size = str_arr[index..-1].size
    loop do
      result << str_arr[index, length].join
      length += 1
      break if length == arr_size + 1
    end
  end
  result
end

# LS Solution
# def substrings(string)
#   results = []
## I LOVE THIS SOLUTION ... in a range means everything but not the last number
#   (0...string.size).each do |start_index|
#     this_substring = string[start_index..-1]
#     results.concat(leading_substrings(this_substring))
#   end
#   results
# end


#examples
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
