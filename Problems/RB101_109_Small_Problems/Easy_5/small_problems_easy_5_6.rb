# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_6.rb

# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

=begin
*******************************************************************************
P-roblem
  Input:
    - string (sentence)
      - letters and apostrophe
      - punctuation and space
  Output:
    - hash
      - keys - the size of each word in sentence
      - values - will count how many words are the same length
  Rules:
    Explicit requirements:
      - return a hash
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases
  - Below

D-ata Structure
  - string
  -̶ c̶r̶e̶a̶t̶e̶ a̶r̶r̶a̶y̶
    -̶ t̶o̶ s̶p̶l̶i̶t̶ i̶n̶d̶i̶v̶i̶d̶u̶a̶l̶ w̶o̶r̶d̶s̶ f̶o̶r̶ c̶o̶u̶n̶t̶i̶n̶g̶
  -̶ c̶r̶e̶a̶t̶e̶ h̶a̶s̶h̶
    - push results of counting array

A-lgorithm - How I would solve this?
  - create an array of the string with the words split

C - Code
  - Below
*******************************************************************************
=end

def word_sizes(string)
  words = string.split(' ')
  hash = {}
  words.each do |word|
    if hash.has_key?(word.size)
      hash[word.size] += 1
    else
      hash[word.size] = 1
    end
  end
  hash
end

# refactored
def word_sizes(string)
  hash = Hash.new(0)
  string.split.each { |word| hash[word.size] += 1 }
  hash
end

# Launch School Solution

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     counts[word.size] += 1
#   end
#   counts
# end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
