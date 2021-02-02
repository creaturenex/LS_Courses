# What is Object Oriented Programing?

It is a way for developers to partition data that can be changed or manipulated without affecting the whole program.

The ability to section off areas of code that performed certain procedures so that programs could become the interaction of many small parts, as opposed to one massive blob of dependency.

## **KEYWORDS**
### Encapsulation
  Hiding pieces of code functionality and making them unavailable to the rest of the code base, so it can not be changed or manipulated. Ruby does this by creating objects and interfaces (meaning methods) to interact with those object.

### Polymorphism
  The ability of different types of data to respond to a common interface (ie methods)

  Example if an method is passed an object as an argument, an object that contain a similar method can also be passed into the initial method.

  **Inheritance** The ability of a class to inherit the behaviors of another class referred to as **superclass**. It allows the ability to define basic classes with large usability and smaller subclasses with fine-grained and detailed behavior.

  Another polymorphic structure is in Ruby are `Modules`. Modules are similar to classes in that they contain shared behavior, but unlike a class you cannot create objects from a module.

  A module must be mixed with a class using the `include` method, to allow the class and it's objects access to the module behaviors. This is called a **mixin**.
