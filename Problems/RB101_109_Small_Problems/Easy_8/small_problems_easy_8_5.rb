# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- takes a string and return a list of all substring that are palindromic
  - palindronic >> the word when spelled backwards
- Use method from last time
- the return value should be in the same sequence as the substring
- duplicate palidrone should be included

Example Test Cases (Implicit Rules):
- string can have non alpha chars like "-"
- string does not have numeric chars
- looks like spaces are ignored
- has to be greater than two chars

Data Structure:
- Input
  - string of non-numeric chars
- Output
  - array of palindronic substring sections in same order as in substring


Algorithm:
- string clean up
  - remove spaces
  - use string gsub
- push cleaned up string into old method
  - returns array of all substring
- iterate through substring array
  - select if ele.reverse == ele
by using select should return only truthy elements


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

def palindromes(string)
  p substrings(string.gsub(" ", "")).select { |ele| ele if ele.reverse == ele && ele.length > 1}
end

p palindromes('ab cd') == []
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
