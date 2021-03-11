class CustomSet
  attr_accessor :set

  def initialize(set = [])
    raise TypeError.new if set.class != Array && set.all? {|ele| ele.class == Integer }
      @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    result = false
    if set.empty?
      result = true
    else
      other.set.each_index { |idx| result = true if other.set.slice(idx..-1) == set }
    end
    result
  end

  def disjoint?(other)
    #rewrite to say any
    result = true
    set.each { |num| result = false if other.contains?(num)}
    other.set.each { |num| result = false if contains?(num)}
    result
  end

  def eql?(other)
    set.sort.uniq == other.set.sort.uniq
  end

  def add(num)
    set << num unless contains?(num)
    self
  end

  def intersection(other)
    new_set = set.select {|num| other.contains?(num) }
    CustomSet.new(new_set)
  end

  def difference(other)
    new_set = set.select {|num| !other.contains?(num) }
    CustomSet.new(new_set)
  end

  def union(other)
    new_set = self.set + other.set
    CustomSet.new(new_set.uniq.sort)
  end

  def ==(other)
    eql?(other)
  end

end

set = CustomSet.new
set.add(3)
p set.set
