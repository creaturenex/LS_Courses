class RomanNumeral
  def initialize(num)
    @num = num.digits.reverse
  end

  def to_roman
    ary = @num.clone
    ary_size = ary.size
    result = ''
    ary.each do |num|
      roman = selection(ary_size)
      result << case num
      when 0    then ''
      when 1..3 then roman[0] * num
      when 4    then roman[0] + roman[1]
      when 5    then roman[1]
      when 6..8 then roman[1] + roman[0] * (num - 5)
      when 9    then roman[0] + roman[2]
      end
      ary_size -= 1
    end
    result
  end

  def selection(size)
    case size
    when 1 then %w(I V X)
    when 2 then %w(X L C)
    when 3 then %w(C D M)
    else        %w(M)
    end
  end
end

# LS Solution
class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end
