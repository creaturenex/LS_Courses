# As you know by now, classes are the blueprints for objects. Below are some
# practice problems that test your knowledge of the connection between classes
# and objects.


# Question 1
# Given the below usage of the Person class, code the class definition.

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

# My Solution
# class Person
#     attr_accessor :name

#     def initialize(name)
#         @name = name
#     end
# end

# bob = Person.new('bob')
# puts bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'


# Question 2
# Modify the class definition from above to facilitate the following methods.
# Note that there is no name= setter method now.

# My Solution
# In my class definition, my code assumes that when the object is initialized
# with the name argument, that name was only first name,

# class Person

#     attr_accessor :first_name, :last_name

#     def initialize(name)
#         @first_name = name
#         @last_name = ''
#     end

#     def name
#         puts "#{first_name} #{last_name}"
#     end
# end

# LS Solution
# this code assumes the object initialized with a name argument can be either
# one or more names long as a result, the name can split into first or last name

# class Person
#     attr_accessor :first_name, :last_name

#     def initialize(full_name)
#       parts = full_name.split
#       @first_name = parts.first
#       @last_name = parts.size > 1 ? parts.last : ''
#     end

#     def name
#       "#{first_name} #{last_name}".strip
#     end
#   end

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# Hint: let first_name and last_name be "states" and create an instance method
# called name that uses those states.


# Question 3
# Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

# class Person
#     attr_accessor :first_name, :last_name

#     def initialize(full_name)
#       parts = full_name.split
#       @first_name = parts.first
#       @last_name = parts.size > 1 ? parts.last : ''
#     end

#     def name # getter
#         puts "#{first_name} #{last_name}"
#     end

#     def name=(full_name) # setter
#         parts = full_name.split
#         self.first_name = parts.first
#         self.last_name = parts.size > 1 ? parts.last : ''
#     end
#   end

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# puts bob.name = "John Adams"
# puts bob.first_name            # => 'John'
# puts bob.last_name             # => 'Adams'

#Question 4
# Using the class definition from step #3, let's create a few more people --
# that is, Person objects.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name # getter
#     puts "#{first_name} #{last_name}"
#   end

#   def name=(full_name) # setter
#     parts = full_name.split
#     self.first_name = parts.first
#     self.last_name = parts.size > 1 ? parts.last : ''
#   end
# end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')
# puts bob.name
# puts rob.name
# puts bob.name == rob.name


# Question 5
# Continuing with our Person class definition, what does the below print out?

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
		self.last_name = parts.size > 1 ? parts.last : ''
	end

	def to_s
			name
	end

end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

## Ruby always call to_s to anything inside #{} in string interpolation
