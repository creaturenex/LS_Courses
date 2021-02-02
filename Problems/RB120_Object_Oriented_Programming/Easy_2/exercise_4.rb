# Reverse Engineering
# Write a class that will display:

# ABC
# xyz

# when the following code is run:
# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  def initialize(message)
    @message = message
  end

  # def to_s
  #   "#{@message}"
  # end
  def uppercase
    @message.upcase
  end

  def self.lowercase(data)
    data.downcase
  end
end


my_data = Transform.new('abc')
puts my_data
puts my_data.uppercase
puts Transform.lowercase('XYZ')
