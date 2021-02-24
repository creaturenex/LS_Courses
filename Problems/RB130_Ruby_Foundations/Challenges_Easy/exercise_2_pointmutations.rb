class DNA
  attr_accessor :initial_dna

  def initialize(dna_strand)
    @initial_dna = dna_strand.chars
  end

  def hamming_distance(other_dna_strand)
    other_dna = other_dna_strand.chars
    short_dna = initial_dna.size < other_dna.size ? initial_dna : other_dna
    counter = 0
    short_dna.each_with_index do |amino, idx|
      counter += 1 if amino != long_dna[idx]
    end
    counter
  end
end

# LS solution
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand : comparison
    differences = 0

    shorter.length.times do |index|
      differences += 1 unless @strand[index] == comparison[index]
    end

    differences
  end
end
