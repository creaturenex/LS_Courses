=begin

=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *produce, grain|
  puts "#{produce.join(', ')}"
  puts "#{grain}"
end

# Output
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do | fruit, *produce , grain |
  puts "#{fruit}"
  puts "#{produce.join(', ')}"
  puts "#{grain}"
end

# Output
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do | fruit, *nonfruit|
  puts "#{fruit}"
  puts "#{nonfruit.join(', ')}"
end

# Output
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, #{d}"
end

# Output
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
