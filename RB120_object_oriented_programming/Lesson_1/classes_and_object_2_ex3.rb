class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# We get the following error
# test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

=begin
  We get this error because on line 2 we have an getter method only, meaning it can only access the instance variable not make changes to it. We can fix this by either changing it to attr_accessor(both read and write) or attr_writer (with write only).
=end
