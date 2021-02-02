def find_next_square(sq)
  sqrt = Math.sqrt(sq)
  if sq == 0
    1
  elsif sqrt / sqrt.to_i != 1
    -1
  else
    (sqrt.to_i + 1)**2
  end
end

p find_next_square(0) == 1
# p find_next_square(121) == 144
# p find_next_square(625) == 676
# p find_next_square(319225) == 320356
# p find_next_square(15241383936) == 15241630849

# # "should return -1 for numbers which aren't perfect squares" do
# p find_next_square(155) == -1
# p find_next_square(342786627) == -1
