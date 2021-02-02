# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string and return a list of all the substring, sorted by substring length

Example Test Cases (Implicit Rules):
- based on examples string are only alpha chars, no special chars or nums
- no empty string


Data Structure:
- Input
  - string - alpha chars only
- Output
  - array - with substring sort by substring length

Algorithm:
- initiate empty array
- split string by chars
- iterate through array using each with index
  - for each letter slice using index
    - join the sliced array
    - push into emtpy array
- return array
*******************************************************************************
=end


def leading_substrings(string)
  result = []
  string.chars.each_with_index do |_, index|
    result << string.chars[0..index].join
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
