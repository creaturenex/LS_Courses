# LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Easy1_4.rb

# Write a method that counts the number of occurrences of each element in a given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

# count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != # 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# first idea
# vehicles.uniq.each {|index| puts vehicles.count(index)}

def count_occurrences(array)
  array.uniq.each {|index| puts "#{index}" + " => " + "#{array.count(index)}"}
end

# Launch School Solution

# def count_occurrences(array)
#   occurrences = {}

#   array.each do |element|
#     occurrences[element] = array.count(element)
#   end

#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end

count_occurrences(vehicles)
