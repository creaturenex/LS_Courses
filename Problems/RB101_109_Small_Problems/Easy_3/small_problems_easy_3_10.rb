# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_10.rb

# Time -
# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

# Examples:

# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true


def palindromic_number?(number)
  number.to_s.reverse.to_i == number
end

pp palindromic_number?(34543)
pp palindromic_number?(123210)
pp palindromic_number?(22)
pp palindromic_number?(5)
