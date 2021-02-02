Practice Problems: Medium 1
# Question 1
# Ben asked Alyssa to code review the following code:
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."
# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"
# Who is right, Ben or Alyssa, and why?

# Solution 1
# Both are valid option but I believe Ben is the preferred method as it is
# calling on the getter/reader method



# Question 2
# Alan created the following code to keep track of items for a shopping cart application he's writing:
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.
# Can you spot the mistake and how to address it?

# Solution 2
# quantity = updated_count if updated_count >= 0
# The quantity method is only a getter method per it being in attr_reader and not writer or attr_accessor.
# This would work if we change attr_reader to attr_accessor



# Question 3
# In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?

# Solution 3
# No this will work, by changing from :reader to :accessor, it will allow :quantity to be directly accessible by the object and so will the setter method.



# Question 4
# Let's practice creating an object hierarchy.

# Create a class called Greeting with a single instance method called greet that takes a string argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

# Solution 4
# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end



# Question 5
# You are given the following class that has been implemented:
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    if @glazing == nil
      "#{}"
    else
      "#{@filling_type} with #{@glazing}"
    end
  end
end
# And the following specification of expected behavior:
donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  => "Plain"

puts donut2
  => "Vanilla"

puts donut3
  => "Plain with sugar"

puts donut4
  => "Plain with chocolate sprinkles"

puts donut5
  => "Custard with icing"
Write additional code for KrispyKreme such that the puts statements will work as specified above.

# Solution 5
# class KrispyKreme
#   def initialize(filling_type , glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     @filling_type == nil ? @filling_type = "Plain" : @filling_type
#     @glazing == nil ? "#{@filling_type}" : "#{@filling_type} with #{@glazing}"
#   end
# end



# Question 6
# If we have these two methods:
class Computer
  attr_accessor :template

  def create_template # setw instance variable directly
    @template = "template 14231"
  end

  def show_template # access instance variable through method
    template # accessible from attr_accessor via getter method
  end
end

class Computer # using instance methods to access instance variable
  attr_accessor :template

  def create_template # sets instance variable from attr_accessor via setter
                      # method
    self.template = "template 14231"
  end

  def show_template # access instance variable through method
    self.template
  end
end

# What is the difference in the way the code works?

# Solution 6
# In the second example self. is not need because the template is only getting
# the instance variable through a getter method. If a setter method is used,
# then self. would be necessary.



# Question 7
# How could you change the method name below so that the method name is more
# clear and less repetitive?
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end
# Solution 7
# change self.light_status to self. status, so it will read Light.status
