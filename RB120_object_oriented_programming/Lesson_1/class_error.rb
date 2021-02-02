class Person

    attr_accessor :name

    def initialize(name)
        self.name = name
    end

    def say_hello
        hi
    end

    private
        
        def hi
            puts "Hello"
        end

end

bob = Person.new("Bob")
bob.say_hello
# bob.hi

# The error occurs because the method `hi` is currently private and not accessable to the object itself
# the error can be solved by referencing the private method within a method inside the class