# OOP Notes



## What is an object **state**?
- An object state usually refers to the instance variable of an object.
- Instance variables keep track of an object state.
  - @variable

## What is an object **behavior**?
- An object behavior refers to the instance method of an object.
- Instance methods exposes an object's behavior.

## How do you identify an instance variable?
``` ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

# @name is the instance variable
# Notice that it is scoped inside of the class GoodDog
```

## What is an accessor method?
- An accessor method is a method that accesses an instance variable ie only returns only the instance variable.
  - What is a *getter* method?
    - A getter method allows returns an instance variable.
  - What is a *setter* method?
    - A setter method allows assignment of a value to an instance variable.

## How does ruby create accessor methods?
- At the start of a class definition you can enter the following.
- **attribute_accessor** creates both getter and setter methods with the same name as the instance variable.
- **attribute_reader** creates only the getter method ie it *reads* the instance variable.
- **attribute_writer** creates only the setter method ie it *writes* the instance variable.

## What is the self method?
**self can be used in two ways**
- First on an object of class. The **self** method is used to call an instance method on the object itself. Typically used when a method is a setter method.
- Second on class itself. The *self* method is used in the method definition. This allows for for the creation of class methods, ie method that only works on the class and not on any instance of the class.

## What are class methods?
- Class methods are methods that are invoked on the class itself and not objects of the class.
  - class methods are created when methods are defined using
  ```ruby
  def self.method
    # code
  end
  ```

## What are class variables?
- Class Variables are variables that are scoped within a class.
  - @@variable

## What is the to_s method?
- The **to_s** method is used by the **puts** method. It has a default setting that when called on an object returns a memory string.
- The default **to_s** method can be overwritten by creating our own to_s instance method.

## Inheritance
Classes can inherit instance methods/variables from a *Parent* class with the inheriting class being the *Child* class. This allows for the child class to be cleaner as it will have the same instance variables and methods of the parent.

A child's method can overwrite an inherited parent method

## What does the keyword **super** do?
- **super** when used in a method invokes the method that was inherited from the parent can be used within the same method inside a child class.
  - **super** typically used with **initialize** method, but can be used with any method.
  - **super** can also take in arguments.

## What are modules?
- Modules are encapsulated code that maybe be incorporated into a class by using the keyword include Name_of_module.
  - This would be an example of a **mixin**
- Modules also be use to organize class ie name_spacing to keep your code organized.
  - namespacing is just grouping similar class within a module
- Modules cannot create instance objects

## Method lookup of classes
- The #ancestor method allows you see where **Ruby** will search the object hierarchy for a method.
  - first ruby will search within the initial class first
  - second ruby will search within included modules
    - if multiple modules are include, ruby will start with the bottom module first and work up the listed.
  - third ruby will check parent classes for modules
  - fourth ruby will check any inherited modules inside the parent class.

## What is method access control?
- Access control for method comes in following
  - Private Method
    - can only be accessed by another method within the class.
    - can NOT be accessed directly by an object.
    - can NOT be accessed using self.
  - Protected Method
    - can be accessed using self.
    - can NOT be accessed directly by an object.
  - Public Method
    - Default access for methods, object or class can access the method.
