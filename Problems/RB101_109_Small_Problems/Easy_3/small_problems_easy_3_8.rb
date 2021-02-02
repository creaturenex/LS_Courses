# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_8.rb

# Time -
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and
# backward. For this exercise, case matters as does punctuation and spaces.

# Examples:
# palindrome?('madam')            == true
# palindrome?('Madam')            == false # (case matters)
# palindrome?("madam i'm adam")   == false # (all characters matter)
# palindrome?('356653')           == true

def palindrome?(string)
  string.reverse == string
end

pp palindrome?('madam')
pp palindrome?('Madam')
pp palindrome?("madam i'm adam")
pp palindrome?('356653')
puts "............"

# Further Exploration
# Write a method that determines whether an array is palindromic; that is, the
# element values appear in the same sequence both forwards and backwards in the
# array.
# Now write a method that determines whether an array or a string is
# palindromic; that is, write a method that can take either an array or a
# string argument, and determines whether that argument is a palindrome. You
# may not use an if, unless, or case statement or modifier.


def palindromic?(array)
  array == array.reverse
end

pp palindromic?([1, 2, 3, 4, 5, 6])
pp palindromic?([1, 2, 3, 3, 2, 1])
pp palindromic?(%w[a b c d e f])
pp palindromic?(%w[a b c c b a])
puts "............"

def palindrome_str_ary?(str_ary)
  str_ary.reverse == str_ary
end

pp palindrome_str_ary?('madam')
pp palindrome_str_ary?('Madam')
pp palindrome_str_ary?("madam i'm adam")
pp palindrome_str_ary?('356653')
pp palindrome_str_ary?([1, 2, 3, 4, 5, 6])
pp palindrome_str_ary?([1, 2, 3, 3, 2, 1])
pp palindrome_str_ary?(%w[a b c d e f])
pp palindrome_str_ary?(%w[a b c c b a])
