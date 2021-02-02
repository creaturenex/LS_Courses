# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_4.rb

# Time - 2 mins
# Create a method that takes two arguments, multiplies them together, and
# returns the result.

# Example:

# multiply(5, 3) == 15

def multiply(num1, num2)
  num1 * num2
end

multiply(5, 3)

# Further Exploration
# For fun: what happens if the first argument is an Array?
# What do you think is happening here?

# Because we are using the * operator I assume we will get
# [[Array],[Array],[Array]] . I was incorrect, I did not look at the
# documentation. Tested in IRB, will return [Array, Array, Array].

# LS Solution
def multiply1(num1, num2)
  num1 * num2
end

# There are a couple of points of interest for this solution.
# Focus on the return value. Consider the below incorrect implementation.

def multiply2(num1, num2)
  puts num1 * num2
end

multiply(1, 2) # returns nil

# If you run the code above, you may think that this method fulfills the
# requirements of the exercise, but it doesn't. It's important to remember to
# focus on the method's return value and not its output. Also, keep in mind
# that puts returns nil,and the above incorrect implementation will always
# return nil.

# The current implementation uses the * operator, which behaves differently
# depending on what the left hand expression is. For example:

# 5 * 2     # => 10
# "hi" * 2  # => "hihi"

# Therefore, our method implementation also suffers from this behavior since
# we're using the * operator.
