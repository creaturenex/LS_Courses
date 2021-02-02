# Exercise for the reader: What if we wanted to transform the
# numbers based on their position in the array rather than their
# value?

# Try coding a solution that doubles the numbers that have odd
# indices:

my_numbers = [1, 4, 3, 7, 2, 6]

p "my_numbers before method #{my_numbers}"

def index_double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    if counter.odd?
      doubled_numbers << numbers[counter] * 2
    else
      doubled_numbers << numbers[counter]
    end
    counter += 1
  end
  p doubled_numbers
end

index_double_odd_numbers(my_numbers)

p "my_numbers after method #{my_numbers}"

puts my_numbers
