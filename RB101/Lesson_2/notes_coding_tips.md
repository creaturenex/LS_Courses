## Lesson 2 Exercise 16 Notes Coding Tips

### Naming Things
- Don't save on characters when naming thing, be descriptive!
  - This applies to variables and methods

```ruby
# bad
x = 4 + 4
# good
sum = 4 + 4
```
- Use `snake_case` when naming everything in ruby
  - exception include classes which are `CamelCase` or constant which are all `UPPERCASE`

### Mutating Constants
- Don't change the value of a constant or it isn't a constant.
  - `CONSTANTS` should be immutable

```ruby
CARDS = [1, 2, 3]
# this array should not be modified at all as it is a constant.
```

### Methods
- Should only do one thing.
- Needs to be short **10**-15 lines of code.
- Ruby always returns a value, the return value shouldn't be the intent of the method.
- Decide whether the method should return a value with no side effects or perform side effects with no return value.
  - If you do both, you probably won't remember what the method does when you need to use it.
- The method name should reflect whether it has side effects or not (for example, some methods in the standard Ruby library end with a ! when the method has side effects).
