[comment]: # (LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_8.md)

### Problem
Ruby version 2.4.0 introduced an `Array#min` method not available in prior versions of Ruby; we wrote this exercise before that release. To follow along, please use the documentation for Ruby 2.3.0 [here](https://ruby-doc.org/core-2.3.0/Array.html).

Use irb to run the following code:
```ruby
a = [5, 9, 3, 11]
puts a.min
```
Find the documentation for the `#min` method and change the above code to print the two smallest values in the `Array`.

A solution that uses the #min method alone requires version 2.2.0 or higher of Ruby. If you have an older version of Ruby, you need a different approach.


### Solution
```ruby
puts a.min(2)
puts a.sort.take(2)
```

#### **[.take](https://ruby-doc.org/core-2.3.0/Array.html#method-i-take) & [.sort](https://ruby-doc.org/core-2.3.0/Array.html#method-i-sort)**
- .sort - rearranges the array in order
- .take - takes the first element in the array, parenthesis(x) return first x elements

#### **[.min](https://ruby-doc.org/core-2.6.5/Array.html#method-i-min)**
- .min - returns the minimum values in the array, parenthesis(x) return first x minimum elements
