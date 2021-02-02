# define a class
class Box
  # constructor method
	attr_accessor :width, :height
	
	def initialize(w,h)
    @width, @height = w, h
  end
 
end
 
# create an object
box = Box.new(10, 20)
 
# use accessor methods
x = box.width
y = box.height
 
puts "Width of the box is : #{x}"
puts "Height of the box is : #{y}"

puts box