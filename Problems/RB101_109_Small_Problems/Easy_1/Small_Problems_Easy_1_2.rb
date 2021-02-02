# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy1_2.rb

# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# ex
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

def is_odd?(num)
  num.abs % 2 != 0
end

# def is_odd?(num)
#  num % 2 == 1
# end
# This always works because % in ruby is a modulus operator not remainder as in other languages. That means always return a non negative number if the number to the right is positive
# left num % num right

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)
