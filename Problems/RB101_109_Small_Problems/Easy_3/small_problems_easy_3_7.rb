# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_3_7.rb

# Time -
# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of
# the argument Array.

# Examples:

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

a = [2, 3, 4, 5, 6]
b = [1, 2, 3, 4, 5, 6]
c = ['abc', 'def']
d = [123]
e = []

def oddities(array)
  array.select { |element| element if array.index(element).even? }
end

oddities(a)
oddities(b)
oddities(c)
oddities(d)
oddities(e)

Further Exploration

def oddities_inverse1(array)
  array.select { |element| element if array.index(element).odd? }
end

oddities_inverse1(a)
oddities_inverse1(b)
oddities_inverse1(c)
oddities_inverse1(d)
oddities_inverse1(e)

def oddities_inverse2(array)
  new_array = []
  index = 1
  loop do
    break if index >= array.size

    new_array << array[index]
    index += 2
  end
  new_array
end

oddities_inverse2(a)
oddities_inverse2(b)
oddities_inverse2(c)
oddities_inverse2(d)
oddities_inverse2(e)
