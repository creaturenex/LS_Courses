class CircularQueue
  attr_accessor :queue

  def initialize(buffer_size)
    @queue = Array.new(buffer_size)
    @items_history_by_index = Array.new
  end

  def enqueue(new_item)
    if queue.none?(nil) then dequeue end

    queue.each_with_index do |item, index|
      if item.nil?
        queue[index] = new_item
        @items_history_by_index << index
        break
      else
        next
      end
    end
  end

  def dequeue
    deleted_item = nil
    if queue.all?(nil)
      nil
    else
      deleted_item = queue[@items_history_by_index.first]
      queue[@items_history_by_index.shift] = nil
    end
    deleted_item
  end
end

queue = CircularQueue.new(3) # [nil, nil, nil]
puts queue.dequeue == nil # true

queue.enqueue(1) # [1, nil, nil]
queue.enqueue(2) # [1, 2, nil]
puts queue.dequeue == 1 # true ie [nil, 2, nil]

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
