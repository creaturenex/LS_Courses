# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string as an argument and return a list(array) of all the substring that are palindromic. the return value should be in the same sequence as it appears in the string, duplicated palindromes should be included multiple times.

Example Test Cases (Implicit Rules):
- No capital letters
- special character included in palindrome
- not sure what to do about spaces, might split string into words? or not included?

Data Structure:
- Input
  - string comprised of lower case string chars and special chars
- Output
  - array of sub strings that are palindromes, and are in order based on string location

Algorithm:
-

return final array

*******************************************************************************
=end

def palindromes(str)
  result = []
  str_arr = str.chars
  str_arr.each_with_index do |letter, index|
    max_length = str_arr[index..-1].size
    length = 2
    loop do
      break if length > max_length
      sub_str = str_arr[index, length].join
      result << sub_str if sub_str == sub_str.reverse
      length += 1
    end
  end
  p result
end



p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
