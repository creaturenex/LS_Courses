LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_2.md

Assume you have the following code:

```ruby
require 'date'

puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)
```

What will each of the 4 `puts` statements print?

puts Date.new
=> -4712-01-01

puts Date.new(2016)
=> 2016-01-01

puts Date.new(2016, 5)
=> 2016-05-01

puts Date.new(2016, 5, 13)
=> 2016-05-13
