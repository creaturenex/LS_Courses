class Element
  attr_reader :datum, :next

  def initialize(datum, next_ele = nil)
    @datum, @next = datum, next_ele
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :array

  def initialize
    @array = Array.new
  end

  # returns list size
  def size
    array.size
  end

  # returns boolean if list is empty
  def empty?
    array.empty?
  end

  # returns the data value from the head of the list
  def peek
    self.empty? ? nil : array.first.datum
  end

  # returns the element from the head of the list
  def head
    array.first
  end

  def tail
    array.last
  end

  # returns list reversed
  def reverse
    list = SimpleLinkedList.new
    list.array = @array.reverse
    list
  end

  # removes the head of the list
  def pop
    array.shift.datum
  end

  # adds argument to list
  def push(ele)
    last_in = head
    array.unshift(self.empty? ? Element.new(ele) : Element.new(ele, last_in))
  end

  def self.from_a(new_array)
    list = SimpleLinkedList.new
    if new_array.nil?
      list.array = []
    else
      new_array.reverse.each { |ele| list.push(ele)}
    end
    list
  end

  def to_a
    array.map { |ele| ele.datum}
  end
end

a = SimpleLinkedList.from_a([1, 2])
b = a.reverse

puts '>>>'
puts b.peek
puts '>>>'
puts b.head.next
puts '>>>'
puts b.tail
puts '>>>'

puts a.head
puts '>>>'
puts a.head.next
puts '>>>'
puts a.tail
puts '>>>'
