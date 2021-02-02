=begin
  # Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

  class Person
    attr_accessor :name, :first_name, :last_name

    def initialize(name)
      split_name = name.split
      if split_name.size == 1 then split_name << ''
      self.first_name = split_name[0]
      self.last_name = split_name[1]
      @name = first_name + last_name
      end
    end

    def name=(name)
      split_name = name.split
      if split_name.size == 1 then split_name << ''
      self.first_name = split_name[0]
      self.last_name = split_name[1]
      @name = first_name + last_name
      end
    end
  end

  bob = Person.new('Robert')
  puts bob.name                  # => 'Robert'
  puts bob.first_name            # => 'Robert'
  puts bob.last_name             # => ''
  puts bob.last_name = 'Smith'
  puts bob.name                  # => 'Robert Smith'

  puts bob.name = "John Adams"
  puts bob.first_name            # => 'John'
  puts bob.last_name             # => 'Adams'

=end

=begin
  # Using the class definition from step #3, let's create a few more people -- that is, Person objects. If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

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
  end

  bob = Person.new('Robert Smith')
  rob = Person.new('Robert Smith')

  puts bob.name == rob.name
=end

=begin

  # class Dog
  #   def speak
  #     'bark!'
  #   end

  #   def swim
  #     'swimming!'
  #   end
  # end

  # class Bulldog < Dog
  #   def swim
  #     "can't swim"
  #   end
  # end
  # teddy = Dog.new
  # puts teddy.speak           # => "bark!"
  # puts teddy.swim           # => "swimming!"
  # frank = Bulldog.new
  # puts frank.speak
  # puts frank.swim

  # # One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. For example, bulldogs can't swim, but all other dogs can.

  # # Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

=end

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end
