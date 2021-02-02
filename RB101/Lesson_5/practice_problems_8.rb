# Practice Problem 8

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'],
       second: ['brown', 'fox'],
       third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

# original attempt
hsh.each_value do |ary|
    ary.each do |word|
        word_ary = word.chars
        word_ary.each do |letter|
            if letter.match?("aeiou")
                puts letter
            end
        end
    end
end

#LS Solution

# vowels = 'aeiou'

# hsh.each do |_, value|
#   value.each do |str|
#     str.chars.each do |char|
#       puts char if vowels.include?(char)
#     end
#   end
# end

# second attempt
hsh.each_value do |ary|
    ary.each do |word|
        word_ary = word.chars
        word_ary.each do |letter|
            if 'aeiou'.match?(letter) # had this backwards
                puts letter
            end
        end
    end
end
