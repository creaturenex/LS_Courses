=begin
When & is used on an argument object on a method call, the & trys to convert the argument object to a block!

Beaware that & used in method parameter, in a method definition try to convert that argument to a a proc, by using to_s.to_proc ie symbol to proc
=end

def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

def convert_to_base_8(n) #n.to_s(8) = string, but we want a number
  n.to_s(8).to_i
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc
base8_proc = method(:convert_to_base_8).to_proc
# removed R before : as it will only invoked once,


# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8, 10, 12, 14, 16, 33].map(&a_proc) # this is decimal

# &a_proc should be a method.to_proc

[8, 10, 12, 14, 16, 33].map(&base8_proc)

# &method, method proc
# &:method, symbol, which will be converted to a proc

>>
# [10, 12, 14, 16, 20, 41]




# method(&argument) in this case 'argument' is a 'proc', and the '&' converts it to a 'block' in a method invocation.

# def method(&parameter);end in this case 'parameter' is a ' block' and '&' converts it to a 'proc' in a method definition.

# method.to_proc converts the method to 'proc' ie a variable.
