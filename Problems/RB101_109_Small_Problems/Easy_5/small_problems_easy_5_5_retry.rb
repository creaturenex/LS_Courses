# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# Examples:

# cleanup("---what's my +*& line?") == ' what s my line '

=begin
*******************************************************************************
P-roblem
  Input:
    - string with mixed characters
  Output:
    - string with only alphabetical
  Rules:
    Explicit requirements:
      - returns a string with all of the non-alphabetic characters replaced by spaces.
      - If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).
      - all lowercase letter
      - no numbers?
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  - split string into array of chars
    - can use method split or chars
  - create a new array where all non alphabetical chars are replaced with space
  - only one space should be kept if multiple consecutive space are in string
  - with new array

A-lgorithm - How I would solve this?
  - split string into array of characters
  - transform non alpha chars into space
  - create new empty array
  - push chars into empty array
    - if character is a space, check last element in new array
      if last element is a space, do NOT push space into array
      if last element is NOT space, push space into array
  once complete join array into new string

C - Code Below
*******************************************************************************
=end

def cleanup(string)
  str_ary = string.chars
  space_str_ary = str_ary.map do |char|
    if ('a'..'z').include?(char)
      char
    else
      ' '
    end
  end
  cleanup_ary = []
  space_str_ary.select do |char|
    if char == ' '
      if cleanup_ary[-1] != ' '
        cleanup_ary << char
      else
        next
      end
    else
      cleanup_ary << char
    end
  end
  cleanup_ary.join
end

p cleanup("---what's my +*& line?") == ' what s my line '
