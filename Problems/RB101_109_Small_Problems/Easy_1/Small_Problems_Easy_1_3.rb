# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy1_3.rb

# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# ex
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

def digit_list(num)
  num.digits.reverse
end
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# .divmod method
# divides number by a number, and returns two values: the result of performing an integer division, and the remainder. For example, 12345.divmod(10) returns [1234, 5], and has the advantage of being easy to understand.

# number and remainder are saved as a variable
# The remainder gets pushed into the array
# The loop divmod the new saved number and the loop repea

# Brute Force method
def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

# Idomatic method
def digit_list(number)
  number.to_s.chars.map(&:to_i)
  # number.to_s.chars. maps {|char| char.to_i }
end
# my first idea was very close to this
