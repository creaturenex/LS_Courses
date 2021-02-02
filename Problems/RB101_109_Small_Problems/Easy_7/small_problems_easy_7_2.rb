# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

=begin
Problem:
- given a string as argument
- returns a hash
  - key are symbols lowercase, uppercase, and neither
  - values are the count of the chars in the string that correspond to the key

Example Test Cases (Implicit Rules):
- non alphabetical chars and spaces are counted as neither
- empty string is not counted

Data Structure:
- Input
  - string
- Output
  - hash

Algorithm:
- Create new hash
  - Initialized new hash with key as symbols lowercase, uppercase, and neither and values at 0
- Split string by chars for iteration
- iteration for each chars
  - use if/else statement
    - when lowercase
      - increase value with matching key by 1
    - when uppercase
      - increase value with matching key by 1
    - else neither
      - increase value with matching key by 1
-return hash


=end

def letter_case_count(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0}
  chars_arr = string.chars
  chars_arr.each do |char|
    if ('a'..'z').include?(char)
      hash[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end

# Examples
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
