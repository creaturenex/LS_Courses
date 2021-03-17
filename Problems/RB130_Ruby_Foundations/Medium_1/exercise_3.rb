=begin
Passing Parameters Part 1

Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  yield(items)
end

gather(items) do |items|

  puts "Let's start gathering food." # need to move this into the gather method
  puts "#{items.join(', ')}" # the return of the block goes in here
  puts "Nice selection of food we have gathered!" # need to move this into the gather methods
end

# LS Solution
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }
