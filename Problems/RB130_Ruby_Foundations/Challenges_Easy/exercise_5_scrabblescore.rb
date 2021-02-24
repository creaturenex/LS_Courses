class Scrabble
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    score = 0
      @word.upcase.chars.each do |letter|
        score += case letter
        when */\W/ then 0
        when *%w(A E I O U L N R S T) then 1
        when *%w(D G) then 2
        when *%w(B C M P) then 3
        when *%w(F H V W Y) then 4
        when *%w(K) then 5
        when *%w(J X) then 8
        when *%w(Q Z) then 10
        end
      end
    score
  end

  def self.score(class_word)
    Scrabble.new(class_word).score
  end
end


#LS Solution
# class Scrabble
#   attr_reader :word

#   POINTS = {
#     'AEIOULNRST'=> 1,
#     'DG' => 2,
#     'BCMP' => 3,
#     'FHVWY' => 4,
#     'K' => 5,
#     'JX' => 8,
#     'QZ' => 10
# }
#   def initialize(word)
#     @word = word ? word : ''
#   end

#   def score
#     letters = word.upcase.gsub(/[^A-Z]/, '').chars

#     total = 0
#     letters.each do |letter|
#       POINTS.each do |all_letters, point|
#         total += point if all_letters.include?(letter)
#       end
#     end
#     total
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end
