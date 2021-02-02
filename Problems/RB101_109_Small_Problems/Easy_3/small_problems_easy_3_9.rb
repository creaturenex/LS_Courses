# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_9.rb

# Time -
# Write another method that returns true if the string passed as an argument is
# a palindrome, false otherwise. This time, however, your method should be case-
# insensitive, and it should ignore all non-alphanumeric characters. If you
#  wish, you may simplify things by calling the palindrome? method you wrote in
#  the previous exercise.

# Examples:

# real_palindrome?('madam')           == true
# real_palindrome?('Madam')           == true # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653')          == true
# real_palindrome?('356a653')         == true
# real_palindrome?('123ab321')        == false

def real_palindrome?(string)
  string.gsub(/\W/, '').downcase.reverse == string.gsub(/\W/, '').downcase
end

pp real_palindrome?('madam')
pp real_palindrome?('Madam')
pp real_palindrome?("Madam, I'm Adam")
pp real_palindrome?('356653')
pp real_palindrome?('356a653')
pp real_palindrome?('123ab321')

# LS Solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

=begin
Chances are you reached for a String#gsub here to eliminate the non-
alphanumeric characters. There's nothing wrong with that, but we'll take the
opportunity to use and talk about String#delete instead. #delete is an
interesting method that takes arguments that sort of look like regular
expressions, and then deletes everything formed by the intersection of all its
arguments. See the documentation for complete details.


For our purposes, we need to remove the non-alphanumeric characters; to do
that, we tell delete to delete everything that isn't a letter or digit. We then
pass the result to our original palindrome? method to determine if the cleaned
up string is a palindrome.

Further Exploration
Read the documentation for String#delete, and the closely related
String#count (you need to read count to get all of the information you need for
delete.)

String#count
count([other_str]+) >>>> integer

Each other_str parameter defines a set of characters to count. The intersection
of these sets defines the characters to count in str. Any other_str that starts
with a caret ^ is negated. The sequence c1-c2 means all characters between c1
and c2. The backslash character \ can be used to escape ^ or - and is otherwise
ignored unless it appears at the end of a sequence or the end of a other_str.

String#delete
delete([other_str]+) >>>> new_str
Returns a copy of str with all characters in the intersection of its arguments
deleted. Uses the same rules for building the set of characters as String#count.
=end
