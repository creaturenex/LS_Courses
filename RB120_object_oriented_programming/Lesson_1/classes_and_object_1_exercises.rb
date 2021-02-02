# Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :color, :speed, :model, :year

  def initialize(year, color, model, speed = 0)
    @year = year
    @color = color
    @model = model
    @speed = speed
  end

  def speed_up(number)
    self.speed = number
    puts "You push the gas and accelerate #{speed} mph."
  end

  def break(number)
    self.speed = number
    puts "You push the break and decelerate #{speed} mph."
  end

  def shutoff
    self.speed = 0
    puts "You turn the key off and shut the car off"
  end

  def car_info
    puts "A #{self.color}, #{self.year} #{self.model} that is currently at #{self.speed}mph"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "This car is a #{year}, #{color}, #{model} with a current speed of #{speed} "
  end

end

oscar_car = MyCar.new(2018, "white", "Honda CRV")
puts oscar_car
