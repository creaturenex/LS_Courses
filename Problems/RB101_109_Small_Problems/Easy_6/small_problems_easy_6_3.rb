# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_3.rb

# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout the
# natural world.

# Computationally, the Fibonacci series is a very simple series, but the
# results grow at an incredibly rapid rate. For example, the 100th Fibonacci
# number is 354,224,848,179,261,915,075 -- that's enormous, especially
# considering that it takes 6 iterations before it generates the first 2 digit
# number.

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)

=begin
*******************************************************************************
P-roblem
  Input:
    - Integer
  Output:
    - Integer
  Rules:
    Explicit requirements:
      -
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  -
  -

A-lgorithm - How I would solve this?
  - create an array to push fib operation sequence into
    - array start off at fib = [1, 1]
      keep adding into array until element.digits.count == num
        - return element.index

    - push into array (n-1 + n-2)

C - Code Below
*******************************************************************************
=end

# This is a recursive method as a result the system memory can not handle the large number to compute the answer. To correct this we have to use a iterative method.

def find_fibonacci_index_by_length(num)
  fibonacci = [1, 1]
  case num
  when num == 0 || num == 1
    1
  else
    fibonacci << fibonacci[-1] + fibonacci[-2] until fibonacci.last.digits.count == num
    fibonacci.index(fibonacci.last) + 1
  end
end



# Launch School Solution - This method is iterative

# def find_fibonacci_index_by_length(num)
#   first = 1
#   second = 1
#   index = 2

#   loop do
#     index += 1
#     fibonacci = first + second
#     break if fibonacci.to_s.size >= num
#     first = second
#     second = fibonacci
#   end

#   index
# end

p find_fibonacci_index_by_length(2) == 7      # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12     # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
