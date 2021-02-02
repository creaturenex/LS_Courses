module TowRating

  def self.tow_rating
    puts "This attribute specifies the truck's towing capacity"
  end

  def tow_rating(weight)
    puts "The truck max towing rating is #{weight}"
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@vehicle_count = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@vehicle_count+= 1
  end

  def self.count
    puts "This program has created #{@@vehicle_count} vehicles"
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def info
    puts "Car Specs Color: #{year}, Year: #{year}, Model: #{model}"
  end

  def age
    puts "The vehicle is #{calculate_age} years old"
  end
  # LS age_code
  # def age
  #   "Your #{self.model} is #{years_old} years old."
  # end

  private

  def calculate_age
    start_year = Time.new(@year).year
    end_year = Time.new.year
    end_year - start_year
  end
  
  # LS age_code
  # def years_old
  #   Time.now.year - self.year
  # end
  
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include TowRating
  NUMBER_OF_DOORS = 2
end

CRV = MyCar.new(2018, "Honda CR-V", "White")

F150 = MyTruck.new(2010, "Tesla CyberTruck", "Steel")

CRV.info

F150.info

F150.tow_rating(12000)

Vehicle.count

puts "The truck's color is #{F150.color}"

CRV.age
