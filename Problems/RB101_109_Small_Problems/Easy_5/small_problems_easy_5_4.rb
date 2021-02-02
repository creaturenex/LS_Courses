# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_4.rb

# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

# Examples:
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

=begin
*******************************************************************************
P-roblem
  Input:
    - string
      the string will always contain at least one word.
      each string contains nothing but words and spaces
      every word contains at least one letter
  Output:
    - string modified
  Rules:
    Explicit requirements:
      - same string as before but the first and last letters of every word are
        swapped

    Implicit requirements:
      - Does not say to modified original string

E-xamples / Test cases
  - see below

D-ata Structure
  -split string to array of individual words
  iterate(map) and through each word
    save first char to 1st variable
    save last char to 2nd variable
      first char will replace with 2nd variable
      last char will be replaced with 1st variable
  return joined array with space

A-lgorithm - How I would solve this?
  -

C - Code
*******************************************************************************
=end


def swap(string)
  str_ary = string.split(" ")
  swap_str_ary = str_ary.map do |word|
    first = word[0]
    last = word[-1]
    word[0] = last
    word[-1] = first
    word
  end
  swap_str_ary.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
