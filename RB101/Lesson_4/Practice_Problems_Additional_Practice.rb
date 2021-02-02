# Practice_Problems_Additional_Practice

# Practice Problem 1 - complete
# Turn this array into a hash where the names are the keys
# and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# expected
{"Fred" => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3, "Pebbles" => 4, "BamBam" => 5 }

# LS # Solution
# My Solution
flintstones.each_with_object({}) do |(element), hash|
  hash[element] = flintstones.index(element)
end

# LS Solution
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end



# Practice Problem 2 - complete
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32,
         "Lily" => 30,
         "Grandpa" => 5843,
         "Eddie" => 10,
         "Marilyn" => 22,
         "Spot" => 237 }

# expected
6174

# Solution
# My Solution
total_age = []
ages.each { |key, value| total_age << value }
total_age.sum

# LS Solution
# One solution would be to assign a variable to an initial value of 0 and then
# iterate through the Hash adding each value in turn to the total.
total_ages = 0
ages.each { |_, age| total_ages += age }
put total_ages
# => 6174
# Another option would be to use a Enumerable#inject method.

ages.values.inject(:+)
6174
=begin
This uses ages.values to make an array, then uses the inject method which is
part of the Enumerable module. The strange-looking parameter to inject is
simply a variety of the inject method which says "apply the + operator to the
accumulator and object parameters of inject".

As we have previously discussed, Enumerable is included in Array, and it can be
useful to augment your knowledge of what you can do with arrays by studying
Enumerable. When faced with a problem such as this one however, don't get
tempted to go 'method hunting' in order to reach a solution. As demonstrated,
even if you don't know the #inject method, the problem can be solved equally
well by using #each to iterate through the Hash; you could even use a basic
loop to reach the same result.
=end


# Practice Problem 3 - complete
# In the age hash remove people with age 100 and greater.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# expected
ages = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }

# Solution
# My Solution
ages.select! { |key, value| value < 100 }

# LS Solution
ages.keep_if { |_, age| age < 100 }
=begin
You could also use #select! here. When using similar methods however, it is
important to be aware of the subtle differences in their implementation. For
example, the Ruby Documentation for Hash#select! tells us that it is
"Equivalent to Hash#keep_if, but returns nil if no changes were made", though
in this case that wouldn't have made any difference.
=end



# Practice Problem 4 - complete, used didn't solve
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

# expected
10

# Solution
# My Solution WRONG was using enumerable#min
ages.min { |key, value| value}
# => ["Eddie", 10]

# LS Solution
ages.values.min # Didn't think about Hash#values
# => 10



# Practice Problem 5 - complete didn't solve
# In the array, find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# expected
3

# Solution
# My Solution, could not solve!

# how to get Betty?
# I was stuck on using regex as the only way to find "Be"
flintstones.select { |name| name.to_s if /be/ =~ name }
# => ['Betty']
# how to get 3?
flintstones.index("Betty")
# => 3

# LS Solution
flintstones.index { |name| name[0, 2] == "Be" } # simple solution

# Array#index returns the index of the first object in ary such that the object
# is == to obj. If a block is given instead of an argument, returns the index
# of the first object for which the block returns true. Returns nil if no match
# is found.



# Practice Problem 6 - complete
# Amend this array so that the names are all shortened to just the first three
# characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# expected
["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]

# Solution
# My Solution
flintstones.map! { |name| name[0, 3] }

# LS Solution
flintstones.map! { |name| name[0, 3] }



# Practice Problem 7 - complete
# Create a hash that expresses the frequency with which each letter occurs
# in this string:

statement = "The Flintstones Rock"

# expected
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2} # ... etc

# Solution
# My Solution
letter_frequency = {}
string_array = statement.chars
uniq_chars = statement.chars.uniq
# this would also include "0-9 and symbols"

uniq_chars.each do |chars| # letters could be filtered here
  letter_frequency[chars] = string_array.count(chars) if chars != " "
end

puts "letter_frequency #{letter_frequency.sort.to_h}"
# shorten version
letter_frequency = {}
statement.chars.uniq.each do |chars|
  letter_frequency[chars] = statement.chars.count(chars) if chars != " "
end

# puts "letter_frequency #{letter_frequency.sort.to_h}"

# LS Solution
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end



# Practice Problem 8 - complete didn't solve
# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Solution
# My Solution WRONG had to draw it out to understand what happen
[1, 2, 3, 4]
[2, 3, 4]
[3, 4]
[4]
# Got this section right after reviewing pt 1
1
2

# LS Solution
# first one...
1
3
# second one...
1
2
# To better understand what is happening here, we augment our loop with some
# additional "debugging" information:

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end
# The output is:
"0  [1, 2, 3, 4]  1"
"1  [2, 3, 4]  3"
=begin
From this we see that our array is being changed as we go (shortened and
shifted), and the loop counter used by #each is compared against the current
length of the array rather than its original length.

In our first example, the removal of the first item in the first pass changes
the value found for the second pass.

In our second example, we are shortening the array each pass just as in the
first example...but the items removed are beyond the point we are sampling from
in the abbreviated loop.

In both cases we see that iterators DO NOT work on a copy of the original array
or from stale meta-data (length) about the array. They operate on the original
array in real time.
=end



# Practice Problem 9 - complete 10mins 33sec
# As we have seen previously we can use some built-in string methods to change
# the case of a string. A notably missing method is something provided in
# Rails, but not in Ruby itself...titleize. This method in Ruby on Rails
# creates a string that has each word capitalized as it would be in a title.

# For example, the string:
words = 'the flintstones rock'
# would be:
words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

# Solution
# My Solution
words_array = words.split
cap_words = words_array.map {|word| word.capitalize}
words = cap_words.join(" ") # I am not validating this data

puts words

# LS Solution
words.split.map { |word| word.capitalize }.join(' ')
# my solution equal this, but I didnt clean it up



# Practice Problem 10 - complete 44 mins 39 sec
# Given the munsters hash below, modify the hash such that each member of the
# Munster family has an additional "age_group" key that has one of three values
# describing the age group the family member is in (kid, adult, or senior).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

# expected
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and
# a senior is aged 65+.
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => { "age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Solution
# My Solution
# this was unnessary
# age_group = {"kid" => (1-17), "adult" => (18..640, "senior" => (65..)}
munsters.each_pair do |key, value| # tried hash#values first
  if (1..17).include?(value["age"])
    # munsters[key] = "age_group" => "kid"
    # first attemp, didnt know how to "push"/"add" another key/value to the
    # value(which is a hash)
    value.store("age_group", "kid") #
  elsif (18..64).include?(value["age"])
    value.store("age_group", "adult")
  else
    value.store("age_group", "senior")
  end
end

# LS Solution
# simple solution
munsters.each do |name, details| # each_pair == #each
  case details["age"]
  when 0...18
    details["age_group"] = "kid" # value[key] = value == value#store(key, value)
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
