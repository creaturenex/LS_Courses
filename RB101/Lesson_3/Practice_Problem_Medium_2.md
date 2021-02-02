# Practice Problems: Medium 2

## Question 1

Every named entity in Ruby has an object_id. This is a unique identifier for
that object.

It is often the case that two different things "look the same", but they can be
different objects. The "under the hood" object referred to by a particular
named-variable can change depending on what is done to that named-variable.

In other words, in Ruby, all values are objects...but they are not always the
same object.

Predict how the values and object ids will change throughout the flow of the
code below:

```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end
```

#### Solution 1

```ruby
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0] # this is saying What is the value at index 0 (first array position)

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} {42} with an id of: #{a_outer_id} {85} before the block."
  puts "b_outer is #{b_outer} {"forty two"} with an id of: #{b_outer_id} {47404641829900} before the block."
  puts "c_outer is #{c_outer} {[42]} with an id of: #{c_outer_id} {47404642034380} before the block."
  puts "d_outer is #{d_outer} {42} with an id of: #{d_outer_id} {85} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} {85} before the block and
    is: #{a_outer_inner_id} {85} inside the block."
    puts "b_outer id was #{b_outer_id} {47404641829900} before the block and is: #{b_outer_inner_id} {47404641829900} inside the block."
    puts "c_outer id was #{c_outer_id} {47404642034380} before the block and is: #{c_outer_inner_id} {47404642034380} inside the block."
    puts "d_outer id was #{d_outer_id} {85} before the block and is: #{d_outer_inner_id} {85} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} {22} with an id of: #{a_outer_id} {85} before and: #{a_outer.object_id} {45} after."
    puts "b_outer inside after reassignment is #{b_outer} {"thirty three"} with an id of: #{b_outer_id} {47404641829900} before and: #{b_outer.object_id} {47404641939300} after."
    puts "c_outer inside after reassignment is #{c_outer} {[44]} with an id of: #{c_outer_id} {47404642034380} before and: #{c_outer.object_id} {47404643370060} after."
    puts "d_outer inside after reassignment is #{d_outer} {44} with an id of: #{d_outer_id} {85} before and: #{d_outer.object_id} {89} after."
    puts

    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} {22} with an id of: #{a_inner_id} {45} inside the block (compared to #{a_outer.object_id} {45} for outer)."
    puts "b_inner is #{b_inner} {"thirty three"} with an id of: #{b_inner_id} {47404641939300} inside the block (compared to #{b_outer.object_id} {47404641939300} for outer)."
    puts "c_inner is #{c_inner} {[44]} with an id of: #{c_inner_id} {47404643370060} inside the block (compared to #{c_outer.object_id} {47404643370060} for outer)."
    puts "d_inner is #{d_inner} {44} with an id of: #{d_inner_id} {89} inside the block (compared to #{d_outer.object_id} {89} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} {22} with an id of: #{a_outer_id} {85} BEFORE and: #{a_outer.object_id} {45} AFTER the block."
  puts "b_outer is #{b_outer} {thirty three} with an id of: #{b_outer_id} {47404641829900} BEFORE and: #{b_outer.object_id} {47404641939300} AFTER the block."
  puts "c_outer is #{c_outer} {[44]} with an id of: #{c_outer_id} {47404642034380} BEFORE and: #{c_outer.object_id} {47404643370060} AFTER the block."
  puts "d_outer is #{d_outer} {44} with an id of: #{d_outer_id} {85} BEFORE and: #{d_outer.object_id} {89} AFTER the block."
  puts

  # You will get an error as the variable is not defined within the method
  # definition only inside the last block. The error is prevented by adding the
  # rescue comment in the code.

  puts "a_inner is #{a_inner} {22} with an id of: #{a_inner_id} {45} INSIDE and: #{a_inner.object_id} {} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end
```



## Question 2

Let's look at object id's again from the perspective of a method call instead
of a block.

Here we haven't changed ANY of the code outside or inside of the block/method.
We simply took the contents of the block from the previous practice problem and
moved it to a method, to which we are passing all of our outer variables.

Predict how the values and object ids will change throughout the flow of the
code below:

```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end

def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id,
b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end
```

#### Solution 2
```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} {42} with an id of: #{a_outer_id} {85} before the block."
  puts "b_outer is #{b_outer} {'forty two'} with an id of: #{b_outer_id} {47279291513680} before the block."
  puts "c_outer is #{c_outer} {[42]} with an id of: #{c_outer_id} {47279291513660} before the block."
  puts "d_outer is #{d_outer} {42} with an id of: #{d_outer_id} {85} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id,
  b_outer_id, c_outer_id, d_outer_id)

  # these values stay the same as we are no longer in the inner method an_illustrative_method
  puts "a_outer is #{a_outer} {42} with an id of: #{a_outer_id} {85} BEFORE and: #{a_outer.object_id} {85} AFTER the method call."
  puts "b_outer is #{b_outer} {'forty four'} with an id of: #{b_outer_id} {47279291513680} BEFORE and: #{b_outer.object_id} {47279291513680} AFTER the method call."
  puts "c_outer is #{c_outer} {[42]} with an id of: #{c_outer_id} {47279291513660} BEFORE and: #{c_outer.object_id} {47279291513660} AFTER the method call."
  puts "d_outer is #{d_outer} {42} with an id of: #{d_outer_id} {85} BEFORE and: #{d_outer.object_id} {85} AFTER the method call."
  puts

  # these variables are not in main method, only the inner method which we no longer have access to. hence the rescue portion gets executed.
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and:  #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and:  #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and:  #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and:  #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end

def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id,  b_outer_id, c_outer_id, d_outer_id)

  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} {85} before the method and is:  #{a_outer.object_id} {85} inside the method."
  puts "b_outer id was #{b_outer_id} {47279291513680} before the method and is:  #{b_outer.object_id} {47279291513680} inside the method."
  puts "c_outer id was #{c_outer_id} {47279291513660} before the method and is:  #{c_outer.object_id} {47279291513660} inside the method."
  puts "d_outer id was #{d_outer_id} {85} before the method and is:  #{d_outer.object_id} {85} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} {22} with an id of:
        #{a_outer_id} {85} before and: #{a_outer.object_id} {45} after."
  puts "b_outer inside after reassignment is #{b_outer} {'thirty three'} with an id of:
        #{b_outer_id} {47279291513680} before and: #{b_outer.object_id} {47279291512920} after."
  puts "c_outer inside after reassignment is #{c_outer} {[44]} with an id of:
        #{c_outer_id} {47279291513660} before and: #{c_outer.object_id} {47279291512900} after."
  puts "d_outer inside after reassignment is #{d_outer} {44} with an id of:
        #{d_outer_id} {85} before and: #{d_outer.object_id} {89} after."
  puts

  a_inner = a_outer {22}
  b_inner = b_outer {'thirty three'}
  c_inner = c_outer {[44]}
  d_inner = c_inner[0] }{44}

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} {22} with an id of: #{a_inner_id} {45} inside the method (compared to #{a_outer.object_id} {45} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} {47279291512920} inside the method (compared to #{b_outer.object_id} {47279291512920} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} {47279291512900} inside the method (compared to #{c_outer.object_id} {47279291512900} for outer)."
  puts "d_inner is #{d_inner} {44} with an id of: #{d_inner_id} {89} inside the method (compared to #{d_outer.object_id} {89} for outer)."
  puts
end
```



## Question 3

Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

### Solution 3

```ruby

"My string looks like this now: pumpkins "
"My array looks like this now: ["pumpkins", "rutabaga"]"

# both methods modify the original value but in Ruby the "value" that gets passed in the method parameters(param) is in "reference" to an object.

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # In this case the "+=" is creating a new string object. (I tested it out, we get new IDs) hence the new object lives inside the method (a_string_param).
  an_array_param << "rutabaga" # In this case we are using the same object as the array is only adding a new element because an array can have multiple
end
```


## Question 4

To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

### Solution 4
```ruby
puts "My string looks like this now: 'pumpkinsrutabaga'"
# the string changed in this instance
# this happened because the << method when applied to a string does not alter the object ID of the string, it adds the new elements to the original object

puts "My array looks like this now: ['pumpkins,]"
# the string did change outside of the method.
# in side the method the local object id changed as the array was reassigned(hence new id) instead of pushed in to the original array and preserving the original array object. As this a localized variable once outside of the method it is no longer available
```



## Question 5

Depending on a method to modify its arguments can be tricky:
```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

Whether the above "coincidentally" does what we think we wanted "depends" upon
what is going on inside the method.

How can we refactor this practice problem to make the result easier to predict
and easier for the next programmer to maintain?

### Solution 5
```ruby
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```



## Question 6
How could the unnecessary duplication in this method be removed?
```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```
### Solution 6
