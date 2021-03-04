class Diamond
  attr_accessor :alpha, :width, :diamond

  def initialize(letter)
    @alpha = ('A'..letter).to_a
    @width = alpha.size * 2 - 1
    @diamond = []
  end

  def make_diamond
    top_half
    bottom_half
    diamond.join
  end

  def top_half
    self.diamond = build_base
  end

  def bottom_half
    bottom = build_base
    bottom.pop
    bottom
    self.diamond += bottom.reverse
  end

  def build_base
    result = []
    alpha.each_with_index do |letter, idx|
      if letter == 'A'
        side = (width - 1) / 2
        result << "#{' ' * side}" + letter + "#{' ' * side }\n"
      else
        middle = (idx * 2) - 1
        side = (width - (middle + 2)) / 2
        result << "#{' ' * side}" + letter + "#{' ' * middle}" + letter + "#{' ' * side}\n"
      end
    end
    result
  end

  def self.make_diamond(letter)
    Diamond.new(letter).make_diamond
  end
end

# class Diamond
#   def self.make_diamond(letter)
#     range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
#     diamond_width = max_width(letter)

#     range.each_with_object([]) do |let, arr|
#       arr << make_row(let).center(diamond_width)
#     end.join("\n") + "\n"
#   end

#   private

#   def self.make_row(letter)
#     return "A" if letter == 'A'
#     return "B B" if letter == 'B'

#     letter + determine_spaces(letter) + letter
#   end

#   def self.determine_spaces(letter)
#     all_letters = ['B']
#     spaces = 1

#     until all_letters.include?(letter)
#       current_letter = all_letters.last
#       all_letters << current_letter.next
#       spaces += 2
#     end

#     ' ' * spaces
#   end

#   def self.max_width(letter)
#     return 1 if letter == 'A'

#     determine_spaces(letter).count(' ') + 2
#   end
# end

# Diamond.make_diamond('C')
