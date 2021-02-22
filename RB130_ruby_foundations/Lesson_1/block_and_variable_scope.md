## Blocks and Variables Scope

Remember local variable availability ie scope, depends on where they where initiated.

**Closure and Binding**
Closure = a chunk of code, ie block, proc, and lambda

Proc keeps track of its surrounding context, and drags it around wherever the chunk of code is passed to. In Ruby, we call this its **binding**, or surrounding environment/context. A closure must keep track of its surrounding context in order to have all the information it needs in order to be executed later. This not only includes local variables, but also method references, constants and other artifacts in your code -- whatever it needs to execute correctly

That is why **Procs**

## Symbols to Proc symbol proc

Ruby has a shortcut that allow you transform all the items in a collection.
``` ruby
[1, 2, 3, 4, 5].map do |num|
  num.to_s
end
# => ["1", "2", "3", "4", "5"]

# same
[1, 2, 3, 4, 5].map(&:to_s)
# => ["1", "2", "3", "4", "5"]
```

These symbols, can be chained.

This method works on any collection method that takes a block like map, select, and each
These symbol procs only work with methods that do not take an argument

## Symbol #to_proc
``` ruby
(&:to_s) = { |n| n.to_s }
```
`&` tells Ruby to convert this object to a block, it is expecting the object to be a `Proc` object. If it is not a `Proc` object, it will try to convert it by using #to_proc. If it fails to convert we will get an Error, else the `Proc` is converted to a block.
