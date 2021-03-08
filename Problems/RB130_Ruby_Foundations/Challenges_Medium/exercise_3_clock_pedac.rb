=begin
Clock
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given clock object. Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

Problem
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given clock object. Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

Examples
- see test

Data
input - integer

output

Algorithm
create class Clock
- create instance
  - #at(arg, arg =00), first arg required, second default to zero
  - +() to add time
  - -() to subtract time

- time is measure in military time ie 0 -23hrs
- first arg must be between 0 -23
- second arg equals minute
  - if min < 59 then min = clock min
  else min> 59 then min/60 divmod ie first num gets added to hour and second num becomes minute

hour = first arg
min = second arg

if second arg > 60 then divmod, first num is added to hour and second num becomes minute

- to_s should return string representation of clock
- two clock object with the same time should be equal to each other
 - does this mean make an equal method?
   clock == clock, should be clock.to_s == clock.to_s

Code
- see file

=end
