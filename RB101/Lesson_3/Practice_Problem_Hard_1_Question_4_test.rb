def dot_separated_ip_address?(input_string)
  if input_string.split('.').size == 4
    dot_separated_words = input_string.split('.')
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word) # did not have false initially and the code would excuted no matter if true or false as we were breaking the code with unless (this code gets executed)
    end
    puts true
  else
    puts 'This is not an ip address'
  end
end

def is_an_ip_number?(word)
  (0..255).include?(word.to_i)
end

dot_separated_ip_address?("10.4.5.11")
dot_separated_ip_address?("10.4.5.-11")
dot_separated_ip_address?("1.2.3")
dot_separated_ip_address?("1.2.3.4.5")

=begin
# LS Solution

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

=end
