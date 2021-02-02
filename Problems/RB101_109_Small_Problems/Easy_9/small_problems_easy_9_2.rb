# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- take an integer and
- return
  - if double number, return the same number
  - if not a double number, return the number times two

Example Test Cases (Implicit Rules):
- only integers
  - double numbers are only even
  - odd number are multiplied times two
  - even number might not double number
Data Structure:
- Input
  - integer - any size
- Output
  - integer - if number is double number return same number else return number times two

Algorithm:
- if /else statement
  if even and if number split in half equal are the same number,
    return num
  else return num times two
*******************************************************************************
=end
def twice_split(num)
p num.digits.reverse
end

def twice(num)
  num_arr = num.digits.reverse
  num_size = num_arr.count
  if num_size.even?
    if num_arr[0..(num_size / 2) - 1] == num_arr[num_size / 2..-1]
      num
    else
      num * 2
    end
  else
    num * 2
  end
end

# LS Solution
# def twice(number)
#   string_number = number.to_s
#   center = string_number.size / 2
#   left_side = center.zero? ? '' : string_number[0..center - 1]
#   right_side = string_number[center..-1]

#   return number if left_side == right_side
#   return number * 2
# end



p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
