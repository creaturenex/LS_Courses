# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- take a string as an argument (person first and last name) and
 return the a string with lastname and first name swap position

Example Test Cases (Implicit Rules):
- no middle name
- space not counted

Data Structure:
- Input
  - string with two "name"
- Output
  - string with two names last name first and has a comma

Algorithm:
- string split
return string with index of array for names
*******************************************************************************
=end
def swap_name(name)
  name_arr = name.split(' ')
  "#{name_arr[1]}, #{name_arr[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
