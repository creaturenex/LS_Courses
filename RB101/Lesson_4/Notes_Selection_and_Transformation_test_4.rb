# Try coding a method that allows you to multiply every array item
# by a specified value

my_numbers = [1, 4, 3, 7, 2, 6]
# multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

p my_numbers

def multiply(numbers, parameter)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    multiplied_numbers << numbers[counter] * parameter
    counter += 1
  end
  multiplied_numbers
end

p multiply(my_numbers, 2)
p multiply(my_numbers, 3)
