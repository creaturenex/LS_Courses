# Closures in Ruby
A closure is a general programming concept that allows programmers to save a "chunk of code" and execute it at a later time. It's called a "closure" because it's said to bind its surrounding artifacts (ie, variables, methods, objects, etc) and build an "enclosure" around everything so that they can be referenced when the closure is later executed. It's sometimes useful to think of a closure as a method that you can pass around and execute, but it's not defined with an explicit name.

In Ruby, a closure is implemented through a Proc object, a lambda, or a block. That is, we can pass around these items as a "chunk of code" and execute them later.
