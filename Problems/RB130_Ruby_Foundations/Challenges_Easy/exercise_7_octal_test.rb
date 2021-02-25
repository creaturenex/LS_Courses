require 'prime'

class PerfectNumber

  def initialize(num)
    @num = num
  end

  def classify
    raise StandardError.new if @num < 0
      if Prime.prime?(@num)
        'deficient'
      else
        aliquot = aliquot_ary.reduce(:+)
        case
        when aliquot == @num then 'perfect'
        when aliquot > @num then 'abundant'
        when aliquot < @num then 'deficient'
        end
      end
  end

  def aliquot_ary
    result = (1...@num).to_a.select { |i| @num % i == 0 }
  end

  def self.classify(num)
    PerfectNumber.new(num).classify
  end

end

# LS Solution
# class PerfectNumber
#   def self.classify(number)
#     raise StandardError.new if number < 1
#     sum = sum_of_factors(number)

#     if sum == number
#       'perfect'
#     elsif sum > number
#       'abundant'
#     else
#       'deficient'
#     end
#   end

#   class << self
#     private

#     def sum_of_factors(number)
#       (1...number).select do |possible_divisor|
#         number % possible_divisor == 0
#       end.sum
#     end
#   end
# end
