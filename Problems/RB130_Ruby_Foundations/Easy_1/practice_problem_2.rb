# Optional Blocks
# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# puts compute { 5 + 3 } == 8
# puts compute { 'a' + 'b' } == 'ab'
# puts compute == 'Does not compute.'

# Further Exploration

def compute(parameter)
  block_given? ? yield(parameter) : 'Does not compute.'
end

puts compute(3) { |num| num + 1} == 4
puts compute('a') { |letter| letter + 'z'} == 'az'
puts compute(100) == 'Does not compute.'
