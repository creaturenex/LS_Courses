=begin
Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash.

The characters should be sorted alphabetically.
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

Example Test Cases:
p get_char_count("cba") == { 1 => ["a", "b", "c"] }
p get_char_count("Mississippi") == { 4 => ["i", "s"], 2 => ["p"], 1 => ["m"] }
p get_char_count("Hello. Hello? HELLO!!") == { 6 => ["l"], 3 => ["e", "h", "o"] }
p get_char_count("aaa...bb...c!") == { 1 => ["c"], 2 => ["b"], 3 => ["a"] }

p get_char_count("aaabbbccc") == { 3 => ["a", "b", "c"] }
p get_char_count("abc123") == { 1 => ["1", "2", "3", "a", "b", "c"] }
p get_char_count("") == {}
p get_char_count("...$*,+") == {}

Problem:
- Given a String as an argument
- Count the number of times the letter appears { occurence => [characters] }
- characters within the Array should be sorted alphabetically
- Ignore spaces, special characters (non-aplha: ! ? )
- Uppercase and lowecase are same: "a" same as "A"

Example Test Cases (Implicit Rules):
- order of Hash keys do not matter
- lettter "M" is downcase "m"
- ignore special characters
- VALID characters: numeric and alphabet
- empty string, return empty Hash {}
- If all characters are special (INVALID), return empty Hash {}

Data Structure:
- Input? String
- Output? Hash: keys are Integers, Value is an Array of string elements

Algorithm:
Oscar
1. first substitute any non alphanumeric char with an empty space string
  this should return a string comprised of only alpha and numeric chars

2. create new array that is the string separated by characters(save into variable)
using the new array, create a second array comprised of unique chars from the 1st array.(save into variable)

3. count the unique chars in the 1st array

Ali
Given a string
- initialize an empty hash count_hsh
- Count the occurance of each character
- Group all the characters with the same number of occurances togather in a hash
- sort all the array values alphabetically
- return the resulting hash

Count the occurances of each character
- initialize an empty hash count_hsh
- convert all the characters in the string to lowercase
- Convert the input string to an array of characters
- create a new array by removing duplicates from the array
- iterate over the uniq array
- count the times each character appears in the original array.

Pauline
Algo
clean the string
  remove spaces and special chars
  lowercase all chars
count the frequency of each character
  initialize empty hash (freq)
  iterate over the string
  if char excist, increment value by 1
  if not, make key and set value by one
group all the chars with the same frequency together
  initialize empty hash (ans)
  iterater over freq
  if freq value exists, add freq key to ans value
  if freq value does not exits add freq value to ans key
    and set ans key = freq value
sort ans values by apha
  for each value, sort by alpha
return ans

def clean (str)
special_chars = [ '!', '?', '
  str.downcase.

Charles
define new hash
downcase string
split the string into individual characters
  either as array
  or maybe just iterate through the string?
assess each character
  if char meets the condition (alphanumeric)
    then add it to hash...
    (more counting and sorting thoughts)
  else
    ignore and go on to next character
  end

return hash






Mandy
1. Store VALID letters and digits
  - `valid_characters` = string alphabet + string digits

2. Remove INVALID characters
  - initialize a new string `valid_str`
  - #downcase the Input String
  - Iterate over Input String
  - Compare each char and if it isn't a valid char, don't include it in new string
  - String#delete

3. Initialize an empty Hash, default `value` of the hash is []
  - use Hash#new
  - {}

4. Count occurence of characters
  - String#count

5. Store Occurrence => [array of chars] in Hash
    - Sort the `valid_str`
    - IF Hash `value` Array does not include the char
      - hsh[count] << char

6. Return Hash

Austin
# alg
# downcase the string
# remove all chars that are not a-z0-9
# split the string into an array of chars
#sort the array of non-unique chars
# create another array of only the unique characters
# init a final hash object with a default value of []
# iterate over the unique chars
# for each unqiue char, push it into the value bound to the key representing the count of that char in the non-unique, downcased array of chars
# return the final hash


=end

def get_char_count(string)
  string = string.downcase
  string = string.gsub(/[^a-z0-9]/, '')
  string_chars = string.chars.sort
  unique_chars = string_chars.uniq
  final = Hash.new([])
  unique_chars.each {|char| final[string_chars.count(char)] += [char] }
  final

end

################# Solution 1

def get_char_count(str)
  valid_characters = ('a'..'z').to_a.join + '1234567890'
  valid_str = str.downcase.delete("^#{valid_characters}")
  character_occurrences(valid_str)
end

def character_occurrences(str)
  hsh = Hash.new { |hash, key| hash[key] = [] }

  str.chars.sort.each do |char|
    count = str.count(char)
    hsh[count] << char if !hsh[count].include?(char)
  end

  hsh
end

################ Solution 2
def get_char_count(str)
  result = {}
  str = str.downcase

  str.chars.each do |letter|
    next unless letter =~ /[a-z0-9]/

    count = str.count(letter)

    if result.keys.include?(count)
      result[count] << letter
    else
      result[count] = [letter]
    end
  end

  result.each_value { |letters| p letters.sort!.uniq! }
end

############## Solution 3
def get_char_count(str)
  valid_chars = str.downcase.gsub(/[^0-9a-z]/,"").chars
  uniq_chars = valid_chars.uniq.sort
  uniq_chars.group_by { |char| valid_chars.count(char) }
end

p get_char_count("cba") == { 1 => ["a", "b", "c"] }
p get_char_count("Mississippi") == { 4 => ["i", "s"], 2 => ["p"], 1 => ["m"] }
p get_char_count("Hello. Hello? HELLO!!") == { 6 => ["l"], 3 => ["e", "h", "o"] }
p get_char_count("aaa...bb...c!") == { 1 => ["c"], 2 => ["b"], 3 => ["a"] }

p get_char_count("aaabbbccc") == { 3 => ["a", "b", "c"] }
p get_char_count("abc123") == { 1 => ["1", "2", "3", "a", "b", "c"] }
p get_char_count("") == {}
p get_char_count("...$*,+") == {}
