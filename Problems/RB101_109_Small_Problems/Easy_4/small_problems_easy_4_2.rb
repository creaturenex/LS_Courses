# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_4_2.rb

# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st,nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

# Examples:
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

def ordinal(num)
  case num % 100
  when 11, 12, 13 then 'th'
  else
    case num % 10
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else 'th'
    end
  end
end

def century(year)
  (year * 0.01).ceil.to_s + ordinal((year * 0.01).ceil)
end

century(2000)
century(2001)
century(1965)
century(256)
century(5)
century(10103)
century(1052)
century(1127)
century(11201)

# 21.0                20th
# 21.01               21st
# 20.650000000000002  20th
# 3.56                3rd
# 1.05                1st
# 102.03              102nd
# 11.52               11th
# 12.27               12th
# 113.01              113th
