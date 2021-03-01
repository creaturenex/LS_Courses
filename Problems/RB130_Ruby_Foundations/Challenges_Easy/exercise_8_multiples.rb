class SumOfMultiples
    attr_accessor :multiples


  def initialize(*args = [3, 5])
    @multiples = args
  end


  # def self.to(num)
  #   multiple_set = []
  #   multiples.each { |i| (1...20).each { |z| multiple_set << z if z % i == 0} }
  #   multiple_set.uniq!
  # end

end

p SumOfMultiples.new
