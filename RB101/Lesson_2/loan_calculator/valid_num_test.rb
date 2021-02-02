# Test cases for valid numbers in loan calculator application

def valid_num?(num)
  (((num.to_i != 0) && (num.to_f != 0.0)) && ((num.to_i.negative? != true) || (num.to_f.negative != true))) && ((num.to_i.to_s == num) || (num.to_f.to_s == num))
end

puts "0.1".to_i != 0

puts "test cases"       # expectation
puts valid_num?('1')    # true
puts valid_num?('1.5')  # true
puts valid_num?('a')    # false
puts valid_num?('0')    # false
puts valid_num?('0.0')  # false
puts valid_num?('-1')   # true
puts valid_num?('-1.5') # true
puts valid_num?('00')   # false
puts valid_num?('0.1')  # false
