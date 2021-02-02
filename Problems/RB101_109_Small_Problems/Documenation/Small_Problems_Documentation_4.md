[comment]: # (LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_4.md)

### Problem

The `Array#bsearch` method is used to search ordered `Array`s more quickly than `#find` and `#select` can.

Assume you have the following code:

```ruby
a = [1, 4, 8, 11, 15, 19]
```
How would you search this Array to find the first element whose value exceeds 8?


### Solution

```ruby
a = [1, 4, 8, 11, 15, 19]

answer = a.bsearch {|x| x > 8}

puts answer
```

#### **[#bsearch Method](https://ruby-doc.org/core-2.6.5/Array.html#method-i-bsearch)**

Using the ruby documentation above,

.bsearch takes only one argument - a block - and returns an element of the Array to which it is applied. The block is required, and it takes one argument. The text and examples below the signature tell and show us that the block must return true or false when operating in what is called "find-minimum mode", which is the usual use case.
