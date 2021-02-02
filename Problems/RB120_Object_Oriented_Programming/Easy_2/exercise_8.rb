# Fix The Program - Expander
# What is wrong with the following code? What fix(es) would you make?

# class Expander
#   def initialize(string)
#     @string = string
#   end

#   def to_s
#     self.expand(3)
#   end

#   private

#   def expand(n)
#     @string * n
#   end
# end

# expander = Expander.new('xyz')
# puts expander

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3) #removed the self because its the same as saying expander.expand and we cannot do that with a private method/variable
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
