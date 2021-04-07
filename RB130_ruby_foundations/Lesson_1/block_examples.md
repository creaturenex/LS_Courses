def select(array)
  answer = []
  counter = 0
  while counter < array.size
    yield(array[counter]) == True ? answer << array[counter] : "do nothing"
    counter += 1
  end
  answer
end











array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }
# => 15
reduce(array, 10) { |acc, num| acc + num }
# => 25
reduce(array) { |acc, num| acc + num if num.odd? }
# => NoMethodError: undefined method `+' for nil:NilClass

# make this work
reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']




def reduce1(array)
  type = array.sample.class
  case type
  when Integer
    acc = 0
  else
    acc = type.new # ie "" or []
  end

  counter = 0

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  acc
end

reduce1(a){ |acc, num| acc + num }
