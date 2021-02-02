my_numbers = [1, 4, 3, 7, 2, 6]

# This method does transform the original array

def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2
    # the above section can be abbreviatedas
    # numbers[counter] = numbers[counter] * 2
    # this can be futher abbreviated to
    # numbers[counter] *= 2

    counter += 1
  end
  numbers
end

double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers

=begin

Method that did not transform original array, only select the values from it.

def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end
=end
