# Given an array of string made only from lowercase letter, return an array of all chars that are in all the strings within the given array, including duplicates.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- given a an array of string return an array of letter common in all strings

Example Test Cases (Implicit Rules):
- if a letter is a duplicate it should appear in the return array

Data Structure:
- Input
  - array of strings (words)
- Output
  - array of strings (letters)

Algorithm:
-
*******************************************************************************
=end

def common_chars(arr)
  result = []
  arr.each_with_index do |word, index|
   case index
   when 0
    word.chars.each {|letter| result << letter}
   else
    word_chars = word.chars
    result.each_with_index do |common_letter, idx|
      if word_chars.include?(common_letter)
        next
      else
        result.delete_at(idx)
      end
    end
   end
  end
  p result
end




p common_chars(['bella', 'label', 'roller']) == ["e", "l", "l"]
p common_chars(['cool', 'lock', 'cook']) == ["c", "o"]
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ["o"]
p common_chars(['aabb', 'ccdd', 'eeff', 'ggrr', 'yyzz']) == []
