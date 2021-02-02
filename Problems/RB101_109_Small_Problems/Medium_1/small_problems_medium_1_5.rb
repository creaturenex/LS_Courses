# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- display a 4 pointed using represented using the string char *

Example Test Cases (Implicit Rules):
-

Data Structure:
- Input
  - odd integer
- Output
  - string with char `*` output with multiple lines ,depicting an diamond

Algorithm:
- draw a diamond
  each line is a string output
  line = space + char + space
        space is total width - integer

n = 1

until



*******************************************************************************
=end

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end


# diamond(1)

# *
p diamond(5)

#  *
# ***
#  *
# diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
