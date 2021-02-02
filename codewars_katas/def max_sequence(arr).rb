def max_sequence(arr)
  final_sum = 0
  if arr.empty? || arr.all?(&:negative?)
   final_sum
  else
    arr.each_with_index do |num, index|
    sub_arr = arr[index..-1]
      loop do
        break if sub_arr.empty?
        instance_sum = sub_arr.sum
        final_sum = instance_sum if instance_sum > final_sum
        sub_arr.pop
      end
    end
  end
  final_sum
end


a = [-2, 1, -3, 4, -1, 2, 1, -5, 4]


p max_sequence(a)
