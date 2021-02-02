#You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

#  Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- You have a bank N lights that are initially off, that gets toggles on or off after N repetitions, and every N repetition every N lights gets toggled on off.
Return an array that identifies which lights are on after n repetitions

Ie
round one all lights gets toggled on
round two every second light gets toggled off
round three every third lights gets toggled on/off

Example Test Cases (Implicit Rules):
- Based on the examples below, we only have positive integers

Data Structure:
- Input
  - Positive Integer
- Output
  - array comprised of integers

Algorithm:
- create light bank
  - a hash would be a good object to manipulate data
    - keys, light number
      - number range for number of lights
      - create a hash for num range
    - values, true/false for on/off
      - initialized hash with starting value of false
- toggle lights on/off
  two iteration
  -using range.each for repetition and multiple of key
  -using hash.each to access each key/value in hash

- return only lights that are on
*******************************************************************************
=end

def initialized_light_bank(num)
  hash = {}
  (1..num).each { |number| hash[number] = false}
  hash
end

def toggle_lights(num, hash)
  (1..num).each do |number|
    hash.each { |key, value| hash[key] = !value if key % number == 0 }
  end
  p hash.keys.select {|key| hash[key] == true }
end

light_bank = initialized_light_bank(10)
toggle_lights(10, light_bank)


# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
