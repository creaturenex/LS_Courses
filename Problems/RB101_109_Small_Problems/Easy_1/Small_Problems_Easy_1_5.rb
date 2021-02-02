# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy1_5.rb

# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# Examples:

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

def reverse_sentence(string)
  string.split(" ").reverse.join(" ")
end

# split(class:string)
# splits a string by the specified parameter() and returns an array with each split item its own element.

# reverse(class:string and array)
# reverses the input string/array, in this instance it reversed the array.

# join(class: array)
# returns a string, by converting each element into a string and joins the elements in an array by the specified parameter().

puts reverse_sentence('')
puts reverse_sentence('Hello World')
puts reverse_sentence('Reverse these words')

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
