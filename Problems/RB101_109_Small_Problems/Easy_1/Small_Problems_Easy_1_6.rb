# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy1_6.rb

# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# Examples:
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

def reverse_words(string)
  element = []
  array = string.split(" ")
  array.each do |word|
    if word.length >= 5
      element.push(word.reverse)
    else
      element.push(word)
    end
  end
  element.join(" ")
end

# Launch School Solution
# def reverse_words(string)
#  words = []
# comment: created an emtpy array

#  string.split.each do |word|
# comment: splits string by blank space into indiviual elements(words),
#    word.reverse! if word.size >= 5
# comment: if any of the elements(words) are greater than 5 in length, that words gets reversed.
#    words << word
# comment: << is the same as push
#  end

#  words.join(' ')
# comment: combines all the indiviual elements(words) by add a blank space between each word
#end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
