# Methods
Using loops, such as `loop` or `for`, to iterate over a collection can become
very repetitive. Ruby provides an easier way to work with collections through
the use of built-in methods. In this assignment we'll specifically look at the
methods `each, select, and map`.

## `each`
So far, we've learned that the most effective option for iterating over a
collection is to use a loop, like this:
```ruby
numbers = [1, 2, 3]
counter = 0

loop do
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end
```

Iterating over a collection is such a common task that Ruby provides a method
to do just that. The `each` method is functionally equivalent to using `loop`
and represents a simpler way of accomplishing the same task. Here's an example
that produces the same result as the implementation above:
```ruby
[1, 2, 3].each do |num|
  puts num
end

# In this example, we're working with an array.
[1, 2, 3]

# each is a method that's being called on the array.
.each

# The method takes a block, which is the do … end part.
               do |num|
  puts num
end
```

The code within the block is executed for each iteration. In this case the code
within the block is `puts num` which means each element in the array will be
output by the `puts` method.

How does the block know what `num` is? For each iteration, `each` sends the
value of the current element to the block in the form of an argument. In this
block, the argument to the block is `num` and it represents the value of the
current element in the array.

Since we're working with an array here, `each` knows that there's only one
element per iteration, so `each` sends the block only one argument, `num`.
Hashes, however, need two arguments in order to represent both the key and the
value per iteration. Calling `each` on a hash looks a little different, since
the block has two arguments:
```ruby
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
```

We can iterate over an array or hash in a manual way by using `loop`, or we can
iterate more idiomatically using `each` -- they're equivalent, for the most
part. One of the main differences between them, however, is the return value.
Once `each` is done iterating, it *returns the original collection*. We can
verify this by testing it in irb.
```ruby
irb :001 > [1, 2, 3].each do |num|
irb :002 >   puts num
irb :003 > end
1
2
3
=> [1, 2, 3]
```

Note that `[1, 2, 3].each` is the last expression in the example above, despite
there being some code in the block. Therefore, the return value of the entire
expression is the return value of the each invocation, which is the original
collection (`[1, 2, 3]`).

We can see another example of this by placing `each` within a method. The
return value of `a_method` is the return value of the last expression within
the method. In this example we've slightly changed what happens in the block;
now `puts` is outputting the number for each iteration multiplied by 2.
```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end

# When calling the method we can clearly see that the return value is [1, 2,
# 3]. This is because the last expression in the method is [1, 2, 3].each,
# which # has a return value of [1, 2, 3].

a_method # => [1, 2, 3]
```

What if we added a statement after `#each`? What will the return value of
`a_method` be?
```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end

  puts 'hi'
end
```

The return value of `a_method` has changed to `nil`. Why? The last expression
within the method has changed from `each` to `puts 'hi'`. Since puts always
returns `nil`, the return value of `a_method` is `nil`.
```ruby
a_method # => nil
```

## `select`
We've explored a basic approach to performing selection with `loop`, but arrays
and hashes also have a built-in way to iterate over a collection and perform
selection: through a `select` method that makes doing this significantly
easier. For example, instead of managing a loop manually with a counter and
break condition, we can just do this:
```ruby
[1, 2, 3].select do |num|
  num.odd?
end
```

To perform selection, `select` evaluates the **return value of the block**. The
block returns a value on each iteration, which then gets evaluated by `select`.
Similar to a real method, the return value of the block is the return value of
the last expression within the block.

When evaluating the block's return value, `select` only cares about its
truthiness. Everything in Ruby is considered "truthy" except for `nil` and
`false`. That's not exactly the same thing as saying everything except `nil`
and `false` has a value of `true` in Ruby, but only that it is "truthy". It's a
small, but important, distinction.

If the return value of the block is "truthy", then the element during that
iteration will be selected. If the return value of the block is "falsey" then
the element will not be selected.
```ruby
[1, 2, 3].select do |num|
  num + 1
end
```

For instance, the return value of the block in the above example will always be
a "truthy" value. How do we know that? If the value is anything other than
`false` or `nil`, it's a "truthy" value. In this case, the return value will
always be an integer because `num + 1` is the last expression within the block,
so the block implicitly returns an integer, a truthy value.

The next follow up question is, what will the return value of `select` be?
`select` performs selection based on the truthiness of the block's return
value. If the block's return value is always "truthy", then all of the elements
will be selected. When an element is selected, it's placed in a new collection.
In the above example, once `select` is done iterating, it returns a new
collection containing all of the selected elements, because the selection
criteria -- the block's return value -- is truthy for every element in the
array.
```ruby
irb :001 > [1, 2, 3].select do |num|
irb :002 >   num + 1
irb :003 > end
=> [1, 2, 3]
```

When working with `select`, it's important to always be aware of the return
value of the block. For example, if we place the statement `puts num` on the
last line within the block, how will that affect the return value of `select`?
```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end
```

`select` will now return an empty array. Why is that? Since `puts num` is now
the last evaluated expression in the block, it is the return value of this
expression which determines the return value of the block. We know that `puts`
always returns `nil`, therefore the return value of the block will now be
`nil`, which is considered a "falsey" value. In other words, `select` won't
select any elements because the return value will always be falsey.
```ruby
irb :001 > [1, 2, 3].select do |num|
irb :002 >   num + 1
irb :003 >   puts num
irb :004 > end
1
2
3
=> []
```

The above code can sometimes happen if you're debugging and inadvertently leave
a trailing `puts` as the last expression of a block or method. A seemingly
harmless `puts` can dramatically affect your program.

## `map`
Similar to `select`, `map` also considers the return value of the block. The
main difference between these two methods is that map uses the return value of
the block to perform transformation instead of selection.
```ruby
[1, 2, 3].map do |num|
  num * 2
end
```

In this example, the return value of the block is the product of `num` and `2`.
`map` then takes this value and places it in a **new collection**. This process
is repeated for each element in the original collection. We can see what the
return value of `map` looks like in irb.
```ruby
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num * 2
irb :003 > end
=> [2, 4, 6]

# What happens if we write some code in the block that's not a transformation instruction?

[1, 2, 3].map do |num|
  num.odd?
end
```

The key to remember here is that `map` always performs transformation based on
the return value of the block. In this case, the return value of the block will
be a boolean. This means that the collection returned by `map` will be an array
of booleans.
```ruby
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num.odd?
irb :003 > end
=> [true, false, true]

# What will the return value of map be in the following example?

[1, 2, 3].map do |num|
  num.odd?
  puts num
end
```

It's a little tricky, but you should now have all the necessary information to
evaluate this code properly. Take a few minutes to deconstruct the above
example and try to determine the return value of the code above.

By looking at the last expression within the block, we know that the return
value of the block will always be `nil`. `map` doesn't care about truthiness,
and takes this return value as the transformation criteria. Therefore, the
collection returned by `map` is a new array of `nil`s.
```ruby
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num.odd?
irb :003 >   puts num
irb :004 > end
1
2
3
=> [nil, nil, nil]

# What if the only statement within the block is a string? What will the return
# value of `map` be?

[1, 2, 3].map do |num|
  'hi'
end

# Since 'hi' is the only statement within the block, the return value of the
# block is 'hi', which map will use as the transformation criteria. Therefore,
# the above code will return an array where each element is 'hi'.

irb :001 > [1, 2, 3].map do |num|
irb :002 >   'hi'
irb :003 > end
=> ["hi", "hi", "hi"]
```

|Enumerable <br> At the start of this assignment it was stated that Ruby provides methods like each, select and map. While this is true in a general sense it is important to be aware that the picture is a little more complex in that not all methods are available to all different types of objects. <br><br> Array and Hash both have an each method which is specific to them and defines how the items in those collections are iterated over. <br><br> The select and map (and other) methods are actually defined in a module called Enumerable and are made available to the Array and Hash classes. <br><br> Don't worry at this stage if some or all of this seems confusing; these Object Oriented Programming concepts will be covered in much more depth in later courses. The important thing to understand at this stage is that certain collection types have access to specific methods for a reason. <br><br> For example String doesn't use the Enumerable module and so you cannot call select or map on a string (as we have already seen however we can easily convert a string to an array by calling String#split if we want access to the Enumerable methods of Array).|
-

## Summary
Methods like `each`, `select` and `map` are provided by Ruby to allow for
simpler implementations of common collection manipulation tasks. Using these
methods to iterate, select, and transform a collection is preferred over
manually looping.

To further clarify your understanding of these methods and how they work, use
the following table as a reference:

|Method  |Action        |Considers the return value of the block?| Returns a new collection from the method? | Length of the returned collection  |
|--------|--------------|---|---|---|
|`each`  |Iteration     |No             | No, it returns the original | Length of original   |
|`select`|Selection     |Yes, truthiness| Yes | Length of original or less |
|`map`   |Transformation|Yes            | Yes | Length of original |

These methods each utilize the block's return value in their own way. In the
case of `each`, the return value of the block is simply ignored. Before moving
forward, it is crucial to understand how exactly these methods use the block's
return value to perform their intended task.
