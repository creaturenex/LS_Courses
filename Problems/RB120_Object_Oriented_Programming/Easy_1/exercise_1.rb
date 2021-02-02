# Banner Class
# Behold this incomplete class for constructing boxed banners.

# class Banner
#   def initialize(message)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#   end

#   def empty_line
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# #Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

# # You may assume that the input will always fit in your terminal window.

# # Test Cases #1

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# # Test Cases #2
# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{"-" * (message_line.length - 2)}+"
  end

  # "| #{' ' * (@message.size)} |"

  def empty_line
    "|#{" " * (message_line.length - 2)}|"
  end

  def message_line
    "| #{@message} |"
  end
end

new_banner = Banner.new("Ghostbusters")
puts new_banner

banner1 = Banner.new('To boldly go where no one has gone before.')
puts banner1

banner2 = Banner.new('')
puts banner2
