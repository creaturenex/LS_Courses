class Series
  attr_accessor :num

  def initialize(string_num)
    @num = string_num.reverse.to_i.digits
  end

  def slices(size)
    result = []
    raise ArgumentError if size > num.size
      @num.each_with_index do |_, idx|
        result << @num[idx, size]
      end
      result.select { |item| item.size == size}
  end

end
