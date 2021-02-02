# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_10.rb

# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

=begin
*******************************************************************************
P-roblem
  Input:
    - string with multiple chars
  Output:
    - string with all duplicate charter delete within a word
  Rules:
    Explicit requirements:
      -
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  -
  -

A-lgorithm - How I would solve this?
  -

C - Code Below
*******************************************************************************
=end

# def crunch(string)
#   filtered = []
#   string.chars.each_with_index do |char, index|
#     case index
#     when 0
#       filtered << string[0]
#     else
#       next if char == string[index - 1]
#       filtered << char
#     end
#   end
#     p filtered.join
# end

def crunch(string)
  filtered = []
  string.chars.each_with_index do |char, index|
    if index == 0
      filtered << string[0]
    else
      next if char == string[index - 1]
      filtered << char
    end
  end
    p filtered.join
end

# Launch School Solution

# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length - 1
#     crunch_text << text[index] unless text[index] == text[index + 1]
#     index += 1
#   end
#   crunch_text
# end

# array[-1] if last item is present

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
