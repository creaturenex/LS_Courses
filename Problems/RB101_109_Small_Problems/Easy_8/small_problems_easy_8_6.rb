# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take two integers
  - 1st is the starting number
  - 2nd is the ending number
-using those numbers print out all number between start-end
  - if num is divisible by 3 print Fizz
  - if num is divisible by 5 print Buzz
  - if number is divisible by 3 and 5 print FizzBuzz

Example Test Cases (Implicit Rules):
- base on example no negative integers

Data Structure:
- Input
  - two integers (no negative numbers)
    - 1st is the starting number
    - 2nd is the ending number
- Output
  - outputs a numbers if not divisible by 3, 5 or both
  - if num is divisible by 3 print Fizz
  - if num is divisible by 5 print Buzz
  - if number is divisible by 3 and 5 print FizzBuzz
    return
     - no explicit return criteria
Algorithm:
- create range using start and end
- initialize empty array variable
- will use each to iterate through range
    - use case statement to push result into array base on element in range
- print array.join
*******************************************************************************
=end

def fizzbuzz(num_start, num_end)
  result = []
  (num_start..num_end).each do |num|
    case
    when (num % 3 == 0) && (num % 5 == 0)
      result << 'FizzBuzz'
    when num % 3 == 0
      result << 'Fizz'
    when num % 5 == 0
      result << 'Buzz'
    else
      result << num
    end
  end
  p result.join(', ')
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
