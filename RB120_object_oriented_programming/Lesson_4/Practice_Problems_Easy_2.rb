# Practice Problems: Easy 2

# Question 1
# You are given the following code:
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:
oracle = Oracle.new
oracle.predict_the_future

# Solution 1
# you will get
# "You wil" and either one of the strings from the array



# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:
trip = RoadTrip.new
trip.predict_the_future

# Solution 2
# "You wil" and either one of the strings from the array in the choice method in RoadTrip


# Question 3
# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?
# Solution 3
# Orange,
# Taste,
# Object,
# Kernel,
# BasicObject


# Question 4
# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
# Solution 4
# class BeesWax
#   attr_accessor :type

#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

# Question 5
# There are a number of variables listed below. What are the different types
# and how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"
# Solution 5
# local variable
# instance variable
# class variable


# Question 6
# If I have the following class:
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# Which one of these is a class method (if any) and how do you know? How would
# you call a class method?

# Solution 6
# A class method is defined using self.method which is then called on
# Class.method and not on the object from that class in this case
# Television.manufacturer

# Question 7
# If we have a class such as the one below:
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# Solution 7
# The @@cats_count variable is a class variable that counts all the instances of that class.
# Every time a new Cat object is initialized the @@class variable is increased
# by one per the initialize method.
# Cat.cats_count => 0
# Cat.new("Coon")
# Cat.cats_count => 1


# Question 8
# If we have this class:
class Game
  def play
    "Start the game!"
  end
end
# And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end
# What can we add to the Bingo class to allow it to inherit the play method
# from the Game class?

# Solution 8
# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end


# Question 9
# If we have this class:
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
# What would happen if we added a play method to the Bingo class, keeping in
# mind that there is already a method of this name in the Game class that the
# Bingo class inherits from.

# Solution 9
# The play method in Bingo will overwrite the play method inherited from Game



# Question 10
# What are the benefits of using Object Oriented Programming in Ruby? Think of
# as many as you can.

encapsulate code
