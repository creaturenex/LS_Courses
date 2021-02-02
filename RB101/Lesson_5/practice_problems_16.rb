# Practice Problem 16

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

CHARS = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)
def uuid
  new_uuid = []
  uuid = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx'
  uuid.chars.each do |ele|
    if ele == 'x'
      new_uuid << CHARS.sample
    elsif ele == '-'
      new_uuid << ele
    else
      next
    end
  end
  p new_uuid.join
end

uuid

# LS Solution

# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end


=begin
*******************************************************************************
P-roblem
  Input:
    - no input just generate a code
  Output:
    - generate a UUID with no parameter
      8-4-4-4-12
  Rules:
    Explicit requirements:
      - cannot use to_h method
      -
    Implicit requirements:
      -
      -

E-xamples / Test cases Below

D-ata Structure
  -
  -

A-lgorithm - How I would solve this?
  -

C - Code Below
*******************************************************************************
=end
