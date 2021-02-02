# Buggy Code - Car Mileage
# Fix the following code so it works properly:

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

class Car
  attr_accessor :mileage, :total

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    self.mileage += miles
    # This method is preferred because because you are using the setter method to set the variable you want
    # as opposed to the @milage instance variable in that whatever is in the method will be applied as apposed to the just the value

  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
puts car.mileage
car.mileage = 5000
puts car.mileage
car.increment_mileage(678)
car.print_mileage  # should print 5678
