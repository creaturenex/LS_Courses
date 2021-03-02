class SumOfMultiples
  attr_accessor :multiples

  def initialize(first = 3, second = 5, *args)
    ary = [first, second, *args]
    @multiples = ary
  end

  def to(num)
    multiple_set = [0]
    (1...num).each do |digi|
    multiples.each do |multi|
      digi % multi == 0 ? multiple_set << digi : next
      end
    end
    multiple_set.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

end
