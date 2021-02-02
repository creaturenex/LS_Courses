# 1) Better integer validation.

# The current method of validating the input for a number is very weak.
# It's also not fully accurate, as you cannot enter a 0.
# Come up with a better way of validating input for integers.

def valid_number?(num)
  num.to_i() != 0
end

# my solution
def valid_number2?(num)
  if num.to_i.to_s == num
  	num.to_i.to_s == num
  else
  	num.to_f.to_s == num
  end
end

# test cases
# puts valid_number2?('1')
# puts valid_number2?('1.5')
# puts valid_number2?('a')
# puts valid_number2?('0')
# puts valid_number2?('0.0')
# puts valid_number2?('-1')
# puts valid_number2?('-1.5')
# puts valid_number2?('00')

# LS solutions to L2E14 1) Better integer validation.

# option 1
# def integer?(input)
#  input.to_i.to_s == input
# end

# option 2
# def integer?(input)
#  /^\d+$/.match(input)
# end

# option 3
# def integer?(input)
#  Integer(input) rescue false
# end

# ----------------------------------------------------------------------------- 
# 2) Number validation.

# Suppose we're building a scientific calculator, and we now need to account
# for inputs that include decimals. How can we build a validating method, called
# number?, to verify that only valid numbers, integers or floats, are entered?

def valid_number?(num)
  num.to_i() != 0
end

# my solution also covers float values
def valid_number2?(num)
  if num.to_i.to_s == num
  	num.to_i.to_s == num
  else
  	num.to_f.to_s == num
  end
end

# LS solutions to L2E14 2) Number validation.

# option 1 has us create 2 addtional methods
# def number?(input)
#   integer?(input) || float?(input)
# end

# this allows us to use eith a valid interger or (||) float.
# the float method mimics the interger method but uses to_f instead of to_i

# def float?(input)		see example one as a comparison
#   input.to_f.to_s == input
# end

# option 2
# def float?(input)
#   /\d/.match(input) && /^\d*\.?\d*$/.match(input)
# end

# option 3
# def float?(input)
#   Float(input) rescue false
# end