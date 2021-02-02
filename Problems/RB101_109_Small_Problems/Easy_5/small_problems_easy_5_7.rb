# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_7.rb

# Modify the word_sizes method from the previous exercise to exclude
# non-letters when determining word size. For instance, the length of "it's" is
# 3, not 4.

# Examples
# see below

=begin
*******************************************************************************
P-roblem
  Input:
    - String
      sentence
  Output:
    - Hash
        key equals word size not counting non letter characters
        value equals how many words with the same word size
  Rules:
    Explicit requirements:
      - return a hash with key = word.size
      - cannot count non letter chars
      -
    Implicit requirements:
      - space do not count against count and are not removed
      -

E-xamples / Test cases
  - Below

D-ata Structure
  -
  -

A-lgorithm - How I would solve this?
  -

C - Code
  - Below
*******************************************************************************
=end

def word_sizes(string)
  letter_space = []
  count = Hash.new(0)
  string.chars { |char| letter_space << char if char.match?(/[a-zA-Z ]/) }
  letter_space.join.split.each { |word| count[word.size] += 1 }
  count
end

# Launch School Solution

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     clean_word = word.delete('^A-Za-z')
#     counts[clean_word.size] += 1
#   end
#   counts
# end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
