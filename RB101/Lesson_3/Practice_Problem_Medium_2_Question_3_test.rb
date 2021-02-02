def tricky_method(a_string_param, an_array_param)
  puts "A inside method before modification : '#{a_string_param}'"
  puts "A object ID inside the method before modification #{a_string_param.object_id}"
  a_string_param += ' cat'
  puts "A inside method after modification : '#{a_string_param}'"
  puts "A object ID inside the method after modification #{a_string_param.object_id}"
  puts "B inside method before modification : #{an_array_param}"
  puts "B object ID inside the method before modification #{an_array_param.object_id}"
  an_array_param << 'cat'
  puts "B object ID inside the method after modification #{an_array_param.object_id}"
  puts "B inside method after modification : #{an_array_param}"
end

a = 'dog'
b = ['dog']

puts "#{a}"
p b
puts "A object ID before the method #{a.object_id}"
puts "B object ID before the method #{b.object_id}"

tricky_method(a, b)
puts "A: '#{a}' after method"
puts "B: #{b} after method"
puts "A object ID after method #{a.object_id}"
puts "B object ID after method #{b.object_id}"
