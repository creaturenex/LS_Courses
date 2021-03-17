=begin
Passing Parameters Part 2

Ruby gives us a lot of flexibility when assigning arrays to variables. If we want to assign the entire array to a single variable, we can do that:

Copy Code
birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']
If we want to assign every element to a separate variable, we can do that too:

Copy Code
raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'
Suppose we want to organize our array contents into groups, where variables represent category names. Can we do that without extracting items directly from the array based on their indices?

We can use the splat operator(*) to do something like this:

Copy Code
raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']



Based on the examples shown above, write a method that takes an array as an argument.

The method should yield the contents of the array to a block,

which should assign your block variables in such a way that it ignores the first two elements,

and groups all remaining elements as a raptors array.

=end

# Did not get this, did not understand where the block was in?

def method(array)
  array.each_index do |idx|
    idx == 0 || idx == 1 ? next : yield(*array)
  end
end

method(%w(raven finch hawk eagle)) { |bird| p bird}

# LS soulution

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end
