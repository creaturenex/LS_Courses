def gimme(input_array)
  sorted_middle_element =  input_array.sort[1]
  input_array.index(sorted_middle_element)
end

p gimme([2, 3, 1]) == 0
p gimme([5, 10, 14]) == 1
p gimme([1, 3, 4]) == 1
p gimme([15, 10, 14]) == 2
p gimme([-0.410, -23, 4]) == 0
p gimme([-15, -10, 14]) == 1
