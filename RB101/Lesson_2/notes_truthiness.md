# Lesson 2 Exercise 6 Notes Truthiness

## Boolean

The notion whether a value is "true" or "false" is captured in a **Boolean**
data type. A Boolean is an object whose only purpose is to say whether it is
"true" or "false".

booleans are important in conditionals

Example 1: The below will always output 'hi'.
```ruby
if true
  puts 'hi'
else
  puts 'goodbye'
end
```
Example 2: Conversely, the below will always output 'goodbye'.
```ruby
if false
  puts 'hi'
else
  puts 'goodbye'
end
```

## Expressions and conditionals

When writing code you will not use the "true"/"false" objects directly, instead
you will be evaluating if something is "true"/"false" in a conditional.

Example 3
```ruby
num = 5

if (num < 10)
  puts "small number"
else
  puts "large number"
end
```
The above outputs `"small number"` because the expression `num < 10` evaluates
to `true` .

Example 4: You can substitute the code expression with a method call too.
```ruby
puts "it's true!" if some_method_call
```
The above will output "it's true!" if some_method_call returns a truthy value.

## Logical Operators && and ||

Logical operators will return either a truthy or falsey value when evaluating two expressions.

&& has higher precedence than ||, so Ruby evaluates this part first.

||: this operator is the "or" operator and, in the following examples, will return true if either one of the evaluated objects is true. It's less strict than the && operator.

Short Circuiting: the && and || operators exhibit a behavior called short circuiting, which means it will stop evaluating expressions once it can guarantee the return value.

**TAKEAWAY**

Summary
