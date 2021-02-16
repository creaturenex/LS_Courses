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
  attr_accessor :title, :todos
  alias_method :<<, :add

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_item)
    # this allows you to create a custom error `raise xxxError, "comment" unless etc`
    raise TypeError, "Can Only add Todo objects" unless todo_item?(todo_item)
    todos << todo_item
  end

  def todo_item?(item)
    item.class == Todo
  end

  def to_s
    puts "---- Today's Todos ----"
    todos.each { |todo| puts todo}
  end

end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

system 'clear'

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Alias Test")
list = TodoList.new("Today's Todos")

[todo1, todo2, todo3].each { |todo| list.add(todo) }
list << todo4

begin
  list.add(1)
rescue TypeError => e
  puts e.message
  puts ''
end

list.todos[0].done!

list.to_s
