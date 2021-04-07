# EXAMPLE OF HOW TO DESCRIBE CODE
```ruby
# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end
# clears screen first, then outputs "> hi there"
```
Code Execution
1. Execution starts at method invocation, on line 8. The say method is invoked with two arguments: a string and a block (the block is an implicit parameter and not part of the method definition).
2. Execution goes to line 2, where the method local variable words is assigned the string "hi there". The block is passed in implicitly, without being assigned to a variable.
3. Execution continues into the first line of the method implementation, line 3, which immediately yields to the block.
4. The block, line 9, is now executed, which clears the screen.
5. After the block is done executing, execution continues in the method implementation on line 4. Executing line 4 results in output being displayed.
6. The method ends, which means the last expression's value is returned by this method. The last expression in the method invokes the puts method, so the return value for the method is nil.

Just to quickly retrace our steps, execution went like this:
    ```ruby
    line 8 → line 2 → line 3 → line 9 → line 4 → line 5
    ```


## Example 2
```ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
```

The above method invocation outputs 6. Notice the use of block_given?, which allows us to continue to call the method without a block. Let's trace the code execution in the above code snippet.

1. Execution starts at method invocation on line 10.
2. Execution moves to the method implementation on line 2, which sets 5 to the local variable number, and the block is not set to any variable; it's just implicitly available.
3. Execution continues on line 3, which is a conditional.
4. Our method invocation has indeed passed in a block, so the conditional is true, moving execution to line 4.
5. On line 4, execution is yielded to the block (or the block is called), and we're passing number + 1 to the block. This means we're calling the block with 6 as the block argument.
6. Execution jumps to line 10, where the block local variable num is assigned 6.
7. Execution continues to line 11, where we output the block local variable num.
8. Execution continues to line 12, where the end of the block is reached.
9. Execution now jumps back to the method implementation, where we just finished executing line 4.
10. Execution continues to line #5, the end of the if.
11. Line 6 returns the value of the incremented argument to line 10.
12. The program ends (the return value of #increment is not used)

The sequence of execution looks something like this:
```ruby
line 10 → line 2 → line 3 → line 4 → line 10 → line 11 → line 12
        → line 4 → line 5 → line 6 → line 10 → program ends
```
