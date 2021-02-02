[comment]: # (LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_7.md)

### Problem
Use irb to run the following code:
```ruby
s = 'abc'
puts s.public_methods(all=false).inspect
```
You should find that it prints a list of all of the public methods available to the String s; this includes not only those methods defined in the String class, but also methods that are inherited from Object (which inherits other methods from the BasicObject class and the Kernel module). That's a lot of methods.

How would you modify this code to print just the public methods that are defined or overridden by the String class? That is, the list should exclude all members that are only defined in Object, BasicObject, and Kernel.


### Solution
```ruby
s = 'abc'
puts s.public_methods(all=false).inspect
# or
s.public_methods(false).inspect
```

#### **[.public_methods](https://ruby-doc.org/core-2.6.5/Object.html#method-i-public_methods)**
Returns the list of public methods accessible to obj, including inherited methods from the parent. If the all parameter is set to false, only those methods in the receiver will be listed.

In this case the receiver is the class we are interested (in this example it's String)
