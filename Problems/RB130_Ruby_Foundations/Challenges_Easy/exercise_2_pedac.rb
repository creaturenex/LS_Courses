# Point Mutations
  # Write a program that can calculate the Hamming distance between two DNA strands.

  # A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.

  # The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

  # By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

  # This is called the Hamming distance.
#end


# Copy Code
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- Write a program that can calculate the 'Hamming Distance' between dna strands
  - when comparing two string for each point, if there is a difference then counts as one point of Hamming distance

Example Test Cases (Implicit Rules)(Examples Below):
- See test_file
- Must define a DNA class
  - initialized with a string ie dna strand
- instance_method > hamming_distance
  - this takes requires a string argument
- empty strings return no difference ie 0
- two string are of unequal size then use the shorter string for hammond distance


Data Structure:
- Input
  - String
- Output
  - Integer

Algorithm: How I would solve this?
-

Code:
- Below
*******************************************************************************
=end

class DNA
  attr_accessor :initial_dna, :other_dna, :long_dna, :short_dna

  initialize(dna_strand)
    @initial_dna = dna_strand.chars
  end

  def hamming_distance(other_dna_strand)
    @other_dna = other_dna_strand.chars
    compare_length
  end

  def compare_length()
    if initial_dna > other_dna
      long_dna = initial_dna
      short_dna = other_dna
    elsif other_dna > initial_dna
      long_dna = other_dna
      short_dna = initial_dna
    else
      long_dna = initial_dna
      short_dna = other_dna
    end
  end

  def to_s
    "DNA: #{initial_dna}"
  end
end



dna1 = DNA.new('GGACTGA')
puts dna1

# dna1.hamming_distance('GGACTGA')
# puts dna1.long_dna
