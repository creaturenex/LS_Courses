# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_3.rb

# In the modern era under the Gregorian Calendar, leap years occur in every
# year that is evenly divisible by 4, unless the year is also divisible by 100.
# If the year is evenly divisible by 100, then it is not a leap year unless the
# year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method
# that takes any year greater than 0 as input, and returns true if the year is
# a leap year, or false if it is not a leap year.

# leap_year?(2016)    == true
# leap_year?(2015)    == false
# leap_year?(2100)    == false
# leap_year?(2400)    == true
# leap_year?(240000)  == true
# leap_year?(240001)  == false
# leap_year?(2000)    == true
# leap_year?(1900)    == false
# leap_year?(1752)    == true
# leap_year?(1700)    == false
# leap_year?(1)       == false
# leap_year?(100)     == false
# leap_year?(400)     == true

def leap_year?(year)
  case
  when year % 400 == 0
    true
  when year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

leap_year?(2016)
leap_year?(2015)
leap_year?(2100)
leap_year?(2400)
leap_year?(240000)
leap_year?(240001)
leap_year?(2000)
leap_year?(1900)
leap_year?(1752)
leap_year?(1700)
leap_year?(1)
leap_year?(100)
leap_year?(400)
