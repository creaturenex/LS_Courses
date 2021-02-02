# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_6_10.rb

# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# Examples:

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****
# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

def triangle(num)
  counter = 1
  num.times do
    puts (" " * (num - counter)) + ("*" * counter)
    counter += 1
  end
end

triangle(5)
triangle(9)
