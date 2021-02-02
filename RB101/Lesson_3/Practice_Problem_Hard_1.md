# Practice Problems: Hard 1

## Question 1
What do you expect to happen when the greeting variable is referenced in the last line of the code below?

```ruby
if false
  greeting = “hello world”
end

greeting
```
### Solution 1
I expected an error because the if state would evaluate if TRUE, but instead we got `nil` because we initialize a local variable inside an `if` block, EVEN if that block doesn't get executed the initial variable is still initialized to `nil`.



## Question 2
What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```
### Solution 2
my original guess was wrong, that the greeting should still be the same input_array. This just like Practice Medium 2 Question 4 informal_greeting is referencing the object greetings. but the << method is modifying the original object and not creating a new object.

**The correct answer is**
```ruby
puts greetings
=> {:a=>, "hi there"}
```

## Question 3
In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

A)
```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

B)
```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

C)
```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

### Solution 3

**my solution - WRONG!***

A) one = "two"
   two = "three"
   three = "one"

   still wrong!!!!

Need to look at the method does it actively change the original object? if it does then when you exit the method that modified variable will be present. If the method does not actively change the referenced object then once you exit the method instance all variable/object will be in there previous state.!!!!!!!!!!!

## Question 4
Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called `is_an_ip_number?` that determines if a string is a numeric string between `0` and `255` as required for IP numbers and asked Ben to use it.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```
Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

### Solution 4

```ruby
# my attempt
def dot_separated_ip_address?(input_string)
  if input_string.split('.').size == 4
    dot_separated_words = input_string.split('.')
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word) # did not have false initially and the code would executed no matter if true or false as we were breaking the code with unless (this code gets executed)
    end
    puts true
  else
    puts 'This is not an ip address'
  end
end

def is_an_ip_number?(word)
  (0..255).include?(word.to_i)
end

dot_separated_ip_address?("10.4.5.11")
dot_separated_ip_address?("10.4.5.-11")
dot_separated_ip_address?("1.2.3")
dot_separated_ip_address?("1.2.3.4.5")

=begin
# LS Solution

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

=end

```
