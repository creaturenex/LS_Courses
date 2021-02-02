[comment]: # (LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_5.md)

### Problem

What do each of these puts statements output?
```ruby
a = %w(a b c d e)
# the above is the same as a = ['a', 'b', 'c', 'd', 'e']
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }
```


### Solution
```ruby
puts a.fetch(7)
=> IndexError
# IndexError

puts a.fetch(7, 'beats me')
=> 'beats me'
# provides the default value if the index is invalid

puts a.fetch(7) { |index| index**2 }
=> 49
# block only executes when the index is invalid
```

#### **[#fetch](https://ruby-doc.org/core-2.6.5/Array.html#method-i-fetch)**

.fetch tries to return the element at position index, but throws an IndexError exception if the referenced index lies outside of the array bounds. This error can be prevented by supplying a second argument, which will act as a default value.

Alternatively, if a block is given it will only be executed when an invalid index is referenced.
