# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # I did the inverse of LS Solution
  def add(todo_item)
    raise TypeError, "Can only add Todo objects" unless todo_item?(todo_item)
      @todos << todo_item
    rescue TypeError => e
      puts e.message
      puts ''
  end
  alias_method :<<, :add
  # Not mention anywhere but this must be added after a method is defined, lexically scoped?

  # instance_of? Todo? returns true/false
  def todo_item?(item)
    item.class == Todo
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def done?
    @todos.all? { |todo| todo.done?}
  end

  def item_at(index)
    @todos[index]
  end

  # originally had @todos[index].done! , this uses my item_at method.
  def mark_done_at(index)
    raise IndexError, "Item not marked done at submitted index due to IndexError" if index >= @todos.size
      item_at(index).done!
    rescue IndexError => e
      puts e.message
      puts e.backtrace # for information purposes
      puts ''
  end

  def mark_undone_at(index)
    raise IndexError "Item not marked undone at submitted index due to IndexError" if index >= @todos.size
      item_at(index).undone!
    rescue
      puts e.message
      puts ''
  end

  # this accomplishes the same why use the commented code?, I will get an index error if I use mark_done_at method!
  def done!
    @todos.each { |todo| todo.done!}
    #@todos.each_index { |index| mark_done_at(index)}
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    raise IndexError, "Item not removed at submitted index due to IndexError" if index > @todos.size
      @todos.delete_at(index)
      #todos.delete(item_at(index)) using my select method
    rescue IndexError => e
      puts e.message
      puts ''
  end

  def to_a
    @todos.clone
  end

  def to_s
    puts "---- #{title} ----"
    @todos.each { |todo| puts todo}
  end



end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

system 'clear'

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Alias Test")
list = TodoList.new("Today's Todos")

todo_ary = [todo1, todo2, todo3]
todo_ary.each { |todo| list.add(todo) }
list << todo4

list.remove_at(3)

list.remove_at(100) # outputs comment > list

list.add(1) # outputs comment > only todo objects

# list.mark_done_at

list.mark_done_at(0)

list.mark_done_at(3)

list.to_s


# ---- Interrogating the list -----
list.size
# returns 3

list.first
# returns todo1, which is the first item in the list

list.last
# returns todo3, which is the last item in the list

puts list.to_a # still pending
# returns an array of all items in the list

list.done?
# returns true if all todos in the list are done, otherwise false
