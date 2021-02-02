# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy1_10.rb

#Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary.
# If the boolean is true, the bonus should be half of the salary.
# If the boolean is false, the bonus should be 0.

# Examples:

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000
# The tests above should print true.

def calculate_bonus(num, boolean)
    if boolean == true
        bonus = num / 2
    else
        bonus = 0
    end
    bonus
end

# Launch School Solution

# def calculate_bonus(salary, bonus)
#   bonus ? (salary / 2) : 0
# end
# This is the same as my response but in a different format
# boolean check on the statement and prints the left side of the ":" if true. If false it prints the right side of the ":"

puts calculate_bonus(2800, true)
puts calculate_bonus(1000, false)
puts calculate_bonus(50000, true)
