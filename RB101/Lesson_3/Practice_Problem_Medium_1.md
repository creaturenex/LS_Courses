# Practice Problem Medium 1

## Question 1

Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the
days before computers had video screens).

For this practice problem, write a one-line program that creates the following
output 10 times, with the subsequent line indented 1 space to the right:
```ruby
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

**Solution 1**
```ruby
10.times {|i| puts "The Flintstones Rock!".rjust(i+=21)}
```



## Question 2

The result of the following statement will be an error:
```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```
Why is this and what are two possible ways to fix this?

Solution 2

You are trying to concat a string to a numeric(interger) and concat does not allow for that.

My solution involves converting the numeric to string
```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
```



## Question 3

Alan wrote the following method, which was intended to show all of the factors
of the input number:
```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```
Alyssa noticed that this will fail if the input is 0, or a negative number, and
asked Alan to change the loop. How can you make this work without using begin/
end/until? Note that we're not looking to find the factors for 0 or negative
numbers, but we just want to handle it gracefully instead of raising an
exception or going into an infinite loop.

Bonus 1
What is the purpose of the `number % divisor == 0`?

Bonus 2
What is the purpose of the second-to-last line `(line 8)` in the method (the
`factors` before the method's `end`)?

Solution 3
```ruby
def factors(number)
  divisor = number
  factors = []
  if number <= 0
    puts "Please use positive integers" # this informs the user to use num > 0
  else  
    begin
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end until divisor == 0
  end  
  factors
end
```
Bonus 1

The purpose of the `number % divisor == 0` is to push the result of `number / divisor` to the array `factors` when that statement evaluates true

Bonus 2

The purpose of the second-to-last line (line 8) in the method is to return the
completed array

LS solution

Use a while condition for the loop:
```ruby
while divisor > 0 do # I feel like my method is still valid
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end
```
Bonus Answer 1
Allows you to determine if the result of the division is an integer number (no
remainder). **Note:** I understood this and had that in mind when writing my
solution.

Bonus Answer 2
This is what is the actual return value from the method. Recall that without an
explicit return statement in the code, the return value of the method is the
last statement executed. If we omitted this line, the code would execute, but
the return value of the method would be nil.
**Note:** I was correct did not add the comment about the method being nil.



## Question 4

Alyssa was asked to write an implementation of a rolling buffer. Elements are
added to the rolling buffer and if the buffer becomes full, then new elements
that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for
modifying the buffer?". Is there a difference between the two, other than what
operator she chose to use to add an element to the buffer?
```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

Solution 4

The difference between the two, other than what operator is that the first
method will actually add the new element to the array `buffer`, while the
second method does not mutate the array `input_array`. Although both method
return the same value



## Question 5

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
A user passes in two numbers, and the calculator will keep computing the
sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he
got an error. Something about the limit variable. What's wrong with the code?
```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

How would you fix this so that it works?

Solution 5
```ruby
# the limit was not defined in the method hence the error, in the updated code the limit was added as an additional method parameter
def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```



## Question 6

What is the output of the following code?
```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

Solution 6
```ruby
=> 34
```



## Question 7

One day Spot was playing with the Munster family's home computer and he wrote a
small program to mess with their demographic data:
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa could
stop him, he hit the Enter key with his tail:
```ruby
mess_with_demographics(munsters)
```
Did the family's data get ransacked? Why or why not?

Solution 7

**WRONG! No the data does not get mutated. the method only uses the hash as a
reference and creates a copy of that hash which is then modified.**

CORRECT - The data does get changed. In this specific case, `array[] = value` is actually changing the orginal object (the array `munsters`).



## Question 8

Method calls can take expressions as arguments. Suppose we define a method
called `rps` as follows, which follows the classic rules of rock-paper-scissors
game, but with a slight twist that it declares whatever hand was used in the
tie as the result of that tie.
```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?
```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

Solution 8
``` ruby
# The solution will be paper if you work your way through the code in order
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
puts rps(rps("paper", "rock"), "rock")
puts rps("paper", "rock")
puts "paper"
```



## Question 9

Consider these two simple methods:
```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```
What would be the return value of the following method invocation?

```ruby
bar(foo)
```

Solution 9 - matches LS Solution

The return value of the following method invocation will be `"no"` first the
method foo will always return `yes`. The result of the `foo` method gets passed
into the `bar` method. At point there is a conditional check, because the para
does not equal `"no"` the conditional evaluates to false and the expression is
`"no"`
