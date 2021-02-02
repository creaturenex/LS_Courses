# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_3.rb

# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# Examples:
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0

=begin
*******************************************************************************
P-roblem
  Input:
    - String (the time of day in 24 hour format)
  Output:
    - Integer (the number of minutes before and after midnight, respectively)
  Rules:
    Explicit requirements:
      - Cannot use ruby's Date and Time methods.
      - Return the number of minutes before and after midnight, respectively
      - Return a value in the range 0..1439.
      - two methods
          before
          after
    Implicit requirements:
      - 60 min in 1 hour
      - 60 * 24 = 1 day

E-xamples / Test cases
  - below

D-ata Structure
-split string into 2 parts
declare new varible = 0
  hour
    convert to integer and to minutes
  min
    convert to integer
- the sum all integer values
A-lgorithm - How I would solve this?
  -

C - Code
*******************************************************************************
=end

def after_midnight(time_str)
  time_array = time_str.split(":")
  minute = time_array[0].to_i * 60
  minute += time_array[1].to_i
  if time_str.include?("00:00") || time_str.include?("24:00")
    0
  else
    minute
  end
end

def before_midnight(time_str)
  minute = after_midnight(time_str)
  if time_str.include?("00:00") || time_str.include?("24:00")
    0
  else
    1440 - minute
  end
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
