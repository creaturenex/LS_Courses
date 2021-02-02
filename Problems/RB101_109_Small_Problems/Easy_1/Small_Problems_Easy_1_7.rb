# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy1_7.rb

# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# The tests above should print true.

def stringy(num)
  array = ['1']
  until num == 1
    num -= 1
    if array.last == '1'
      array.push('0')
    else
      array.push('1')
    end
  end
  array.join
end

# i did think about even/odd

# Launch School Solution

# def stringy(size)
#  numbers = []

#  size.times do |index|
#    number = index.even? ? 1 : 0
#    numbers << number
#  end

#  numbers.join
# end

puts stringy(6) # == '101010'
puts stringy(9) # == '101010101'
puts stringy(4) # == '1010'
puts stringy(7) # == '1010101'
