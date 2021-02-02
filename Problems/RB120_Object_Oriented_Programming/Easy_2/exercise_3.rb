# Complete The Program - Houses
# Assume you have the following code:

# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

#and this output:


# Home 1 is cheaper
# Home 2 is more expensive

class House
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def cost(other_house)
    puts self.price > other_house.price ? "Home 1 is cheaper" : "Home 2 is more expensive"
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1
home2.cost(home1)
home1.cost(home2)

# Launch School Solution
# class House
#   attr_reader :price
#   include Comparable

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end
