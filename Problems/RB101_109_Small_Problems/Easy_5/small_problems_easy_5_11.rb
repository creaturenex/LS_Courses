# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_11.rb

# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+


def print_in_box(string)
  puts "+" + (("-" * string.length)+"--") + "+"
  puts "| " + (" " * string.length) + " |"
  puts "| " + string + " |"
  puts "| " + (" " * string.length) + " |"
  puts "+" + (("-" * string.length)+"--") + "+"
end




# Further Exploration
# Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.



print_in_box('To boldly go where no one has gone before.')
print_in_box('')
