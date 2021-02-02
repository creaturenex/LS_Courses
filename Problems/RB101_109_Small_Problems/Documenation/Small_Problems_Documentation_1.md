LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_1.md

Locate the ruby documentation for methods `File::path` and `File#path`. How are they different?

### Solution
Both methods can be found on the documentation page for the `File` class in the Core API section. `File::path` is a class method, while `File#path` is an instance method.

### Discussion
Class methods are called on the class, while instance methods are called on objects. Thus:

```ruby
puts File.path('bin')
```
calls the class method `File::path` since we're calling it on the File class, while:

```ruby
f = File.new('my-file.txt')
puts f.path
```
calls the instance method `File#path` since we're calling it on an object of the `File` class, namely `f`.

Pay attention when reading the documentation; make sure you are using a class method when you need a class method, and an instance method when you need an instance method.
