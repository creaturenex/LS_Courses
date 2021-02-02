# Notes L2E18: Pass by Reference vs Pass by Value

## What does pass by "value" mean?

In order to talk about what "pass by value" traditionally means, we'll talk about it using a traditional language -- C. In C, when you "pass by value", the method only has a copy of the original object. Operations performed on the object within the method have no effect on the original object outside of the method.

Some Rubyists say Ruby is "pass by value" because re-assigning the object within the method doesn't affect the object outside the method. Example:

```ruby
def change_name(name)
  name = 'bob'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name           # => jim
```

What does pass by "reference" mean?
However, it's not quite that simple. If Ruby was pure "pass by value", that means there should be no way for operations within a method to cause changes to the original object. But you can plainly do this in Ruby. For example:
```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name           # => Jim
```

**Ruby exhibits a combination of behaviors from both "pass by reference"
as well as "pass by value". When an operation within the method mutates the
caller, it will affect the original object**

Which operations mutate the caller? Unfortunately, this is something you'll have to slowly discover through usage and reading documentation. For example some methods are destructive even if it does not  use '!'. While other methods might re-reassign but is not considered destructive.

[Read about variable as pointer for more info](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)
