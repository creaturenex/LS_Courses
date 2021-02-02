# Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a positive integer and return the number with the digits reversed

Example Test Cases (Implicit Rules):
- trailing are required
- leading zero are not required
-

Data Structure:
- Input
  - integer compromised of many digits
- Output
  - integer with the digits reversed

Algorithm:
- split integer by digits into an array
*******************************************************************************
=end

def reversed_number(num)
  num.digits.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
