class Octal
  attr_accessor :num, :sum

  def initialize(num)
    @sum = 0
    clean_up(num)
  end

  def clean_up(num)
    num.match?(/\D/) ? @num = nil : @num = num.to_i.digits
  end

  def to_decimal
    non_octal = [8, 9]
    if num.nil? || num.any? { |i| (8..9).include?(i) }
      sum
    else
      num.each_with_index { |digi, idx| self.sum += digi * (8**idx) }
      sum
    end
  end

end

# LS solution
class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless valid_octal?(number)

    arr_digits = number.to_i.digits

    new_number = 0
    arr_digits.each_with_index do |num, exponent|
      new_number += (num * (8 ** exponent))
    end

    new_number
  end

  private

  def valid_octal?(num)
    num.chars.all? {|n| n =~ /[0-7]/}
  end
end
