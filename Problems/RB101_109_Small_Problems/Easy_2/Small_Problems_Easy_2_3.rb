# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy2_3.rb

# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

print 'What is the bill? '
bill = gets.chomp.to_f

print 'What is the tip percentage? '
tip_percent = gets.chomp.to_f

tip = (bill * (tip_percent * 0.01)).round(2)
bill_total = (tip + bill).round(2)
puts "The tip is $#{tip}"
puts "The total is $#{bill_total}"
