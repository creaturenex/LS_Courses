# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_6.rb

# Time -
# The || operator returns a truthy value if either or both of its operands are
# truthy, a falsey value if both operands are falsey. The && operator returns a
# truthy value if both of its operands are truthy, and a falsey value if either
# operand is falsey. This works great until you need only one of two conditions
# to be truthy, the so-called exclusive or.

# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is truthy, false otherwise.

# Examples:

# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

def xor?(arg1, arg2)
  if arg1 == true && arg2 == false || arg1 == false && arg2 == true
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)

=begin
Further Exploration
Can you think of a situation in which a boolean xor method would be useful?
Suppose you were modeling a light at the top of a flight of stairs wired in
such a way that the light can be turned on or off using either the switch at
the bottom of the stairs or the switch at the top of the stairs. This is an xor
configuration, and it can be modeled in ruby using the xor method. Think of
some additional examples.

|| and && are so-called short circuit operators in that the second operand is
not evaluated if its value is not needed.

Does the xor method perform short-
circuit evaluation of its operands? Why or why not? Does short-circuit
evaluation in xor operations even make sense?
=end

# my solution
# The xor method is not a short circuit operator because both sides have to be
# evaluated. One side must be true and the other side must be false when
# comparing both Booleans. The xor method shows that there are two combination
# that meet that criteria.
