# Practice Problems: Easy 2
---
## Question 1
In this hash of people and their age,
```ruby
ages = { "Herman" => 32,
         "Lily" => 30,
         "Grandpa" => 402,
         "Eddie" => 10 }
```
see if "Spot" is present. **Bonus: What are two other hash methods that
would work just as well for this solution?**

Solution 1

```ruby
ages.include?('Spot')
# or
ages.select { |k| k == "Spot" }

ages.rassoc("Spot")

ages.any? { |k| k = "Spot" }
# also #filter, #find_all
```
LS Solution
```ruby
ages.key?("Spot")
# bonus answer - Hash#include? and Hash#member?
```



## Question 2

Starting with this string:
```ruby
munsters_description = "The Munsters are creepy in a good way."
```
Convert the string in the following ways (code will be executed on original
`munsters_description` above):
```ruby
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

Solution 2 - LS Solution were mutating methods !
```ruby
munsters_description.swapcase
munsters_description.capitalize
munsters_description.downcase
munsters_description.upcase
```



## Question 3

We have most of the Munster family in our age hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```
add ages for Marilyn and Spot to the existing hash
```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

Solution 3 - matches LS Solution
```ruby
ages.merge!(additional_ages)
# or
or additional_ages.each { |k, v| ages[k] = v }
```



## Question 4

See if the name "Dino" appears in the string below:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

Solution 4
```ruby
advice.include?("Dino")
```
LS Solution
```ruby
advice.match?("Dino")
# Note that this is not a perfect solution, as it would match any substring with Dino in it.
```



## Question 5

Show an easier way to write this array:
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

Solution 5
```ruby
flintstones = %[Fred Barney Wilma Betty BamBam Pebbles]
# got this wrong above correction below
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```



## Question 6

How can we add the family pet "Dino" to our usual array:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Solution 6 - matches LS Solution
```ruby
flintstones << "Dino"
# or
flintstones.push("Dino")
```



## Question 7

In the previous practice problem we added Dino to our array like this:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```
We could have used either Array#concat or Array#push to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

Solution 7
```ruby
flintstones_pets = %w(Dino Hoppy)
flintstones_pets.each { |v| flintstones.push(v)}
```

LS solution
```ruby
flintstones.push("Dino").push("Hoppy")
# push returns the array so we can chain
# or
flintstones.concat(%w(Dino Hoppy))
# concat adds an array rather than one item
```



## Question 8

Shorten this sentence:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
...remove everything starting from "house".

Review the String#slice! documentation, and use that method to make the
return value `"Few things in life are as important as "`. But leave the
`advice` variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?

Solution 8

part 1
```ruby
advice_sliced = advice.slice!(39..83)
advice
advice = advice_sliced
advice
```
part 2 bonus **FINISH THE BONUS SECTION**
```ruby
advice_sliced = advice.slice(39..83)
advice
advice = advice_sliced
advice
```

LS Solution
```ruby
advice.slice!(0, advice.index('house'))
```



## Question 9

Write a one-liner to count the number of lower-case 't' characters in the
following string:
```ruby
statement = "The Flintstones Rock!"
````

Solution 9 - matches LS Solution
```ruby
statement.count("t")
```



## Question 10

Back in the stone age (before CSS) we used spaces to align things on the
screen. If we had a 40 character wide table of Flintstone family members,
how could we easily center that title above the table with spaces?
```ruby
title = "Flintstone Family Members"
```

Solution 10 - matches LS Solution
```ruby
title.center(40)
```
