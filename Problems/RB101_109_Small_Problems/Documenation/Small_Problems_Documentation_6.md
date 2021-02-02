[comment]: # (LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_6.md)

### Problem

What does this code print?
```ruby
5.step(to: 10, by: 3) { |value| puts value }
```


### Solution
```ruby
5.step(to: 10, by: 3) { |value| puts value }
=> 5, 8
# returns each value starting with the original value by the increment provided.
# This will continue until the limit is exceeded.
```

#### **[#step](https://ruby-doc.org/core-2.5.0/Numeric.html#method-i-step)**

Invokes the given block with the sequence of numbers starting at num, incremented by step (defaulted to 1) on each call.

The loop finishes when the value to be passed to the block is greater than limit (if step is positive) or less than limit (if step is negative), where limit is defaulted to infinity.

In otherwords

.step takes two keyword arguments (also called named arguments), :by and :to (keyword argument names are symbols). This shows up in our method signature:

step(by: step, to: limit) { |i| block } → self
