# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy2_9.rb

# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

Alice
Bob
# You are 100% correct, and the answer should come as no surprise. Now, let's
# look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?

BOB
BOB
# Why? because the original reference object was modified, not reassigned.

# LS Solution
# In the first example data was not modified at all only that a the same
# varible was not acessing information in another location in the second
# example the original data of 'Bob' was mutated by the caller and as a result
# when save_name was not looking at a different location for the data it was
# looking in the same location the original data existed before the upcase!
