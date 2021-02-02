# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_2.rb

# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.
#
# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.
#
# You may not use ruby's Date and Time classes.
#
# Examples:
#
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

=begin
*******************************************************************************
P-roblem
  Input:
    - integer (+ or -)
  Output:
    - string in this format "23:57"
  Rules:
    Explicit requirements:
      - should work with any integer input.
      - If the number of minutes is positive, the time is after midnight
      - If the number of minutes is negative, the time is before midnight.

    Implicit requirements:
      - based on the examples below the date does not matter just time meaning 1 day before or 3 days after midnight etc
      - two

E-xamples / Test cases
  - # time_of_day(0) == "00:00"
    # time_of_day(-3) == "23:57"
    # time_of_day(35) == "00:35"
    # time_of_day(-1437) == "00:03"
    # time_of_day(3000) == "02:00"
    # time_of_day(800) == "13:20"
    # time_of_day(-4231) == "01:29"
  -
D-ata Structure
- so we have total minutes
    need to convert minutes into hours
- if negative count backwards from 24 hours
  if postiv count forward until 24 hours

A-lgorithm - How I would solve this?
  -

C - Code
*******************************************************************************
=end


def time_of_day(minutes)
  clock_hour = "00"
  clock_min = ":00"
  hours_min = (minutes/60.0) % 24
  hour = hours_min.to_i
  min = minutes % 60 #precision lost here ((hours_min - hour) * 60).to_i

  if hour == 0
    clock_hour
  elsif hour.between?(1, 9)
    clock_hour = "0#{hour.to_s}"
  else hour.between?(10,23)
    clock_hour = "#{hour.to_s}"
  end

  if minutes == 0 || min == 0
    clock_min
  elsif minutes.between?(1, 9) || min.between?(1, 9)
    clock_min = ":0#{min.to_s}"
  else minutes.between?(10, 59) || min.between?(10, 59)
    clock_min = ":#{min.to_s}"
  end
  "#{clock_hour}" + "#{clock_min}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
