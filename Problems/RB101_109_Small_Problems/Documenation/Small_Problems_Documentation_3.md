[comment]: # (LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_3.md)

Consider the following method and a call to that method:

```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
```
Use the ruby documentation to determine what this code will print.


### Solution

```ruby
my_method(4,5,6)
=> [4,5,3,6]
```

#### **[Default Positional Arguments](https://ruby-doc.com/core/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments)**

Using the ruby documentation above, if you send three arguments:

```ruby
ex:
  my_method(1, 5, 6)
```

You will see ruby print

```
[1, 5, 3, 6]
```

The first provided value/element is assigned to **a**, then the last provided value/element is assigned to **d**. This leaves only the arguments with default values. In the example above, since 5 has not been assigned to a value yet, it is given to b and c uses its default value of 3.
