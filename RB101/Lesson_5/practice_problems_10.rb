# Practice Problem 10

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr1.map do |hsh|
    p hsh.each_value { |value| value += 1}
end
p arr1
p arr2

# LS Solution

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
    incremented_hash = {}
    hsh.each do |key, value|
      incremented_hash[key] = value + 1
    end
    incremented_hash
  end
  # => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
