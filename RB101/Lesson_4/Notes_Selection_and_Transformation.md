# Selection and Transformation
Now that we know how to loop through a collection, it's time to do something
more interesting. Besides iteration, the two most common actions to perform on
a collection are selection and transformation.

Selection is picking certain elements out of the collection depending on some
criterion. For example, pick out all the odd integers from an array.
Transformation, on the other hand, refers to manipulating every element in the
collection. For example, increment all elements of the array by 1. If there are
n elements in a collection, selection results in n or less elements, while
transformation always results in exactly n elements. Using these two actions,
we can do nearly anything you can imagine to a collection. Therefore, it's
critical to not only understand how to perform these actions, but to develop a
high level of proficiency so you can quickly and fluently work with collections.

Selection and transformation both utilize the basics of looping: a loop, a
counter, a way to retrieve the current value, and a way to exit the loop. Keep
those four things in mind. In addition, selection and transformation require
some criteria; selection uses this criteria to determine which elements are
selected, while transformation uses this criteria to determine how to perform
the transformation.

At this point, you've already seen some examples of selection and
transformation in previous assignments, but here we'll analyze these two topics
in more depth.

## Looping to Select and Transform
Let's start by looking at an example of selection. There are an endless number
of conditions that can be used to perform selection but a basic example
involves the selection of a single character from a string.

In the example below, we want to select all 'g' characters out of a string.
You'll notice that this is just a basic loop with one main addition: the if
statement.
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char    # appends current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => "g"
```

The if condition is what determines which values are selected and which ones
are ignored; this is the selection criteria. The rest of the code is just your
basic loop iterating code.

We can apply these same concepts to transformation. Let's again take a look at
a simple array and loop through it, but with one addition: the modification of
appending an 's' to each string in the array.
```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << current_element + 's'   # appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

transformed_elements # => ["apples", "bananas", "pears"]
```

Since we're applying the transformation to every element in the array, we don't
need an if condition, but the entire line is the transformation criteria. Note
that, in this example, we perform the transformation on a new array and leave
the original array unchanged. When performing transformation, it's always
important to pay attention to whether the original collection was mutated or if
a new collection was returned.

## Extracting to Methods
Most of the time, selecting or transforming a collection is a very specific
action -- select all the odd numbers, turn all elements into strings, etc --
which naturally lends the specific action being extracted into convenience
methods.

Say for example we wanted to be able to select all of the vowels in a given
string. We're going to use the helpful String#include? method here to assist us
in determining whether a character is a vowel.
```ruby
if 'aeiouAEIOU'.include?(current_char)
  selected_chars << current_char
end
```

Let's now put it all together into a select_vowels method so we can call this
method on any string.
```ruby
def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

  selected_chars
end
```

An important thing to note here is that when our method is done iterating over
the collection it returns a new collection containing the selected values. In
this case, our select_vowels method returns a new string.
```ruby
select_vowels('the quick brown fox')      # => "euioo"

sentence = 'I wandered lonely as a cloud'
select_vowels(sentence)                   # => "Iaeeoeaaou"

# We can therefore call other methods on that return value.

number_of_vowels = select_vowels('hello world').size
number_of_vowels # => 3
```
Let's now take a look at an example with hashes. In this example we want to
select the key-value pairs where the value is 'Fruit'.
```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```

How would you implement a method like this?

Solution
```ruby
def select_fruit(produce)
  fruits = {}
  produce.each do |key, value|
    if produce[key].include?('Fruit') then fruits[key] = value
    end
  end
  puts fruits
end

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# LS Solution

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end
    counter += 1
  end
  selected_fruits
end
```

Notice that the original argument, produce_list, is not mutated a new hash is
returned by the method (as opposed to an array or string) We'll now move on to
some transformation examples where the entire transformation code is within a
method definition. The code below multiplies each element in the collection by
2.
```ruby
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

# We can invoke the method like this.

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
```

Note that the double_numbers method returned a new array with every element
doubled, and that the original array is not mutated. In other words, my_numbers
is still `[1, 4, 3, 7, 2, 6]`. This isn't a requirement, but just a consequence
of how we implemented the method.

If we wanted to, we could've easily decided that mutating the method argument
is the right approach. Can you implement a double_numbers! method that mutates
its argument?

Try coding a solution in a code file or irb and then check the answer:Hide

Solution
```ruby
my_numbers = [1, 4, 3, 7, 2, 6]

# This method does transform the original array

def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2
    # the above section can be abbreviatedas
    # numbers[counter] = numbers[counter] * 2
    # this can be futher abbreviated to
    # numbers[counter] *= 2

    counter += 1
  end
  numbers
end

double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers

# LS Solution

def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size
    current_number = numbers[counter]
    numbers[counter] = current_number * 2
    counter += 1
  end
  numbers
end
```

Rather than returning a new array, this method returns a reference to the
(mutated) original array lines 7 and 8 can be shortened to 1 line:
`numbers[counter] = numbers[counter] * 2`. This, in turn, can be further
condensed to `numbers[counter] *= 2`.

Now we can check our method like this.
```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)   # => [2, 8, 6, 14, 4, 12]

my_numbers                    # => [2, 8, 6, 14, 4, 12]
# The argument, my_numbers, is permanently modified.
```

We previously said that transformation is an operation that is performed on
every element in the collection. In the next example, we'll study a method that
only transforms a subset of the elements in the collection. Here, we only
multiply by `2` if the value is odd. The `if` condition will only evaluate to `true` if `current_number` is odd (we check this using `Integer#odd?`).
```ruby
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
```

Once again, note that we are working with a method that does not mutate its
argument and instead returns a new array. We can call it like so:
```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

## not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]
```

Try coding a solution that doubles the numbers that have odd indices

Solution
```ruby
def index_double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    if counter.odd?
      doubled_numbers << numbers[counter] * 2
    else
      doubled_numbers << numbers[counter]
    end
    counter += 1
  end
  p doubled_numbers
end

# LS Solution
def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number
    counter += 1
  end
  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12]
=end
```

## More Flexible Methods
The examples we've looked at so far have taken one argument (the collection to
be iterated over) and performed one operation to that collection. By defining
our methods in such a way that we can pass in additional arguments to alter the
logic of the iteration, we can create more flexible and generic methods.

Recall earlier we wrote a `select_fruit` method that selected fruits out of the
`produce_list` hash of fruits and vegetables. Suppose we wish to now write a
more generic `general_select` method so that we can specify whether we're
interested in selecting fruits or vegetables. Here's how we could build such a
method:
```ruby
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end
```

To use the above general_select method, we have to pass in a collection and
some selection criteria. In this specific case, the criteria is hardcoded to
match with a value: if there's a match between the criteria and value, then the
current key-value pair is selected into the selected_produce hash. Here's how
we can use this method:
```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}
```

Note that we chose to not name the method select because of collision with
Kernel#select, which does something completely different than what we're
talking about here with collections.

Continuing on with the idea of building generic methods, let's update our
double_numbers method to not only be able to double the values in an array, but
to multiply by any number. For example, let's create a method called multiply
that can take an additional argument to determine the transformation criteria.
```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
# Try coding a method that allows you to multiply every array item by a specified value

my_numbers = [1, 4, 3, 7, 2, 6]
# multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

p my_numbers

def multiply(numbers, parameter)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    multiplied_numbers << numbers[counter] * parameter
    counter += 1
  end
  multiplied_numbers
end

p multiply(my_numbers, 2)
p multiply(my_numbers, 3)

# LS Solution
def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiplier
    counter += 1
  end

  multiplied_numbers
end
=end
```

Note that the original argument is not mutated and that we're returning a new
array here.

We'll wrap up this assignment with one more example from earlier. Recall our
initial selection example of selecting the letter `'g'` out of the alphabet.
Let's write a method called `select_letter`, that takes a string and returns a
new string containing only the letter that we specified. We want it to behave
like this:
```ruby
question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""
def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end
```

And because `select_letter` returns a string, if we wanted to, we can continue
to chain string methods on the return value. Suppose we wanted to find out how
many times a letter occurs in a sentence, we could use our method above chained
with `String#size`, like so:
```ruby
select_letter(question, 'a').size # => 8
select_letter(question, 't').size # => 5
select_letter(question, 'z').size # => 0
```

Note that now the return value of the entire expression is an integer.

The for loop

So far, we've been using the Kernel#loop method in the examples to illustrate
how to loop over a collection. But that's just one of many different ways to
loop in ruby. For example, the for loop produces the same result as loop:
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end
```

To print each character, we just had to call the `String#chars` method on
`alphabet` which splits each character into its own element in an array. In
this example, `char` represents the value of the current element in the array.

You can think of `loop` or for as interchangeable syntax, but we're going to use
`loop` for consistency. You might see `for` being used elsewhere; don't worry
about the syntax, the underlying concepts covered in this assignment still
remain.

## Summary
We often want to perform iteration, selection or transformation operations on a
collection. Using these 3 actions, we can manipulate a collection nearly any
way we need to.

Typically, these are generic actions that we can move into a method, so that we
can perform these generic operations repeatedly on different collections.

Pay attention to when the original collection is mutated vs when the method
returns a new collection. This might seem trivial right now, but it's a source
of a lot of misunderstanding. Make certain to study this.

Understand how these methods can be made more generic by allowing for
additional parameters to specify some criteria for selection or transformation.

Finally, it's common to chain actions on collections; but pay special mind to
the return value, especially if the return value is an empty collection or nil.
Trying to chain methods on empty collections or nil is dangerous and results in
a lot of broken programs.
