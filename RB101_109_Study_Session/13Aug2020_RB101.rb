# Intros
# Pass by reference/ Pass by value
# PEDAC Process - Ravy/ Oscar
# Any other questions


# Given two strings, return the characters that are not common in the two strings.


=begin
*******************************************************************************
Problem: (Explicit Rules)
# Given two strings
# - string_a
# - string_b
# - characters from string_a that are not present in string_b, PLUS characters in string_b that are not present in string_a

Example Test Cases (Implicit Rules):
- alpha characters
- returning a string
- input strings
- if there are no unique characters, return an empty string
- the number of occurences of a character is irrelevant.
- characters maintain order in the returned string
- input strings can be different lengths

Data Structure:
- Input
  - two strings
- Output
  - a string (of characters not common in the two input strings)
- represent the strings as arrays arrays

Algorithm:

- check each character in string_a
  - if that character exists in string b, remove it
- check each character in string_b
  - if that character exists in string a, remove it
- combine the two strings

- declare my method
  with two parameters for the inputs

  - initialize a variable with an empty string
  - initialize an array variable comprised of the characters in the string1
  - initialize an array variable comprised of the characters in the string2

  -iterate through each variable array
   - if char is included in the string do not push it to the empty string

  - return the string variable

*******************************************************************************
=end

def unique_string_characters(str1, str2)
  result = ""
  str1_chars = str1.chars
  str2_chars = str2.chars
  str1_chars.each do |char|
    result << char unless str2.include?(char)
  end
  str2_chars.each do |char|
    result << char unless str1.include?(char)
  end
  result
end

# def unique_string_characters(str1, str2)
#   str1.delete(str2) + str2.delete(str1)
# end

p unique_string_characters("xyab","xzca") == "ybzc"
p unique_string_characters("a","z") == "az"
p unique_string_characters("abcd","de") == "abce"
p unique_string_characters("abc","abba") == "c"
p unique_string_characters("xyz","zxy") == ""
