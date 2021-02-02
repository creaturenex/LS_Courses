# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_5.rb

# Time -
# Using the multiply method from the "Multiplying Two Numbers" problem, write a
# method that computes the square of its argument (the square is the result of
# multiplying a number by itself).

# Example:
# square(5) == 25
# square(-8) == 64

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

# Further Exploration
# What if we wanted to generalize this method to a "power to the
# n" type method: cubed, to the 4th power, to the 5th, etc. How
# would we go about doing so while still using the multiply
# method?

def power_to_n(num, n_power)
  if n_power.odd?
    multiply((num * (n_power - 1)), num)
  else
    multiply((num * (n_power / 2)), (num * (n_power / 2)))
  end
end

puts power_to_n(2, 0) # expect 1
puts power_to_n(-2, 0) # expect 1
puts "........................"
puts power_to_n(2, 1) # expect +2
puts power_to_n(2, 3) # expect +8
puts power_to_n(-2, 1) # expect -2
puts power_to_n(-2, 3) # expect -8
puts power_to_n(2, -1) # expect 1/2
puts power_to_n(2, -3) # expect 1/8
puts power_to_n(-2, -1) # expect -1/2
puts power_to_n(-2, -3) # expect -1/8
puts power_to_n(2, 0.1) # expect 1.071773
puts power_to_n(2, 0.3) # expect 1.231144
puts power_to_n(2, -0.1) # expect 0.9330330
puts power_to_n(2, -0.3) # expect 0.8122524
puts "........................"
puts power_to_n(-2, 0.1) # expect -1.071773
puts power_to_n(-2, 0.3) # expect -1.231144
puts power_to_n(-2, -0.1) # expect -0.9330330
puts power_to_n(-2, -0.3) # expect -0.8122524
puts "........................"


puts power_to_n(2, 2) # expect +4
puts power_to_n(2, 4) # expect +16
puts power_to_n(-2, 2) # expect +4
puts power_to_n(-2, 4) # expect +16
puts power_to_n(2, -2) # expect +1/4
puts power_to_n(2, -4) # expect +1/16
puts power_to_n(-2, -2) # expect +1/4
puts power_to_n(-2, -4) # expect +1/16
puts power_to_n(2, 0.2) # expect 1.148698
puts power_to_n(2, 0.4) # expect 1.319508
puts power_to_n(2, -0.2) # expect 0.8705506
puts power_to_n(2, -0.4) # expect 0.7578583
puts "........................"
puts power_to_n(-2, 0.2) # expect -1.148698
puts power_to_n(-2, 0.4) # expect -1.319508
puts power_to_n(-2, -0.2) # expect -0.8705506
puts power_to_n(-2, -0.4) # expect -0.7578583
