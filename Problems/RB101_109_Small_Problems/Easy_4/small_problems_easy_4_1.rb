# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_1.rb

# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# Examples:
#
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

def short_long_short(string1, string2)
  if string1.size > string2.size
    long = string1
    short = string2
  else
    long = string2
    short = string1
  end
  short + long + short
end

short_long_short('abc', 'defgh')
short_long_short('abcde', 'fgh')
short_long_short('', 'xyz')
