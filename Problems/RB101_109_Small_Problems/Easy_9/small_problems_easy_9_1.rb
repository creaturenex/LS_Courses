# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- take two arguments an array and a hash a return a string using info from both the hash and array

Example Test Cases (Implicit Rules):
-

Data Structure:
- Input
  - hash
    - 2 keys title and occupation
    - 2 values - Strings
  - array
    - string
      - first, middle, and last name
- Output
  - string - sentence, saying hello to the person, and information about their occupation

Algorithm:
- use string interpolation access the hash and array
  - for array use arr.join
  - for hash use hash[key] to access info
*******************************************************************************
=end

def greetings(arr, hash)
 p "=> Hello, #{arr.join(' ')}! " \
 "Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end


greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
