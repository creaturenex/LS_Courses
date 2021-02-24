class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word.downcase.chars
  end

  def match(word_list)
    short_list = word_list.select { |item| item.size == word.size }
    permutations = word.permutation.to_a
    permutations.delete(word)
    result = short_list.select do |item|
      downcase_item = item.downcase
      permutations.include?(downcase_item.chars)
    end
    result.sort
  end
end

#LS Solution much more elegant

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |ana|
      ana.downcase != word && anagram?(ana, word)
    end
  end

  private

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end
