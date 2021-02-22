# Triangles
# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than or equal to the length of the third side.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- Write a program, that takes integers as input and outputs a string stating what type of triangle is made from the given sides.
- The program uses a custom Triangle class
- The instantiated object requires three arguments
- instance method #kind, returns the triangle type
- the class raises an error for the following
  - if a side is negative
  - if any side is zero
  - if one side is greater than the sum of the other two
    if the sum of two side is less than the remaining side
  -

Example Test Cases (Implicit Rules)(Examples Below):
- the examples provided in the test case shows we need a


Data Structure:
- Input
  - 3 different values as arguments to the created class triangle.
- Output
  - string, stating what time of triangle is present.
  -

Algorithm: How I would solve this?
-

Code:
- Below
*******************************************************************************
=end

class Triangle
  attr_accessor :triangle

  def initialize(side1, side2, side3)
    @triangle = [side1, side2, side3]
  end

  def kind
    raises_error (ArgumentError) do
      side_count = triangle.uniq.count
      case side_count
      when 1 then 'equilateral'
      when 2 then 'isosceles'
      when 3 then 'scalene'
      then
      end
    end
  end

  def no_size_is_illegal
    @triangle.any?{ |value| value.zero?}
  end

  def negative_size_is_illegal
    @triangle.any?{ |value| value.negative?}
  end

  def size_inequality_is_illegal
  end

  def
  end

  def


  end

end
