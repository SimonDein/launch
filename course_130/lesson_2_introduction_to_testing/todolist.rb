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
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def <<(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of? Todo
      
    @todos << todo
  end
  alias_method :add, :<<

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    each do |todo|
      todo.done!
    end
  end
  alias_method :mark_all_done, :done!

  def undone!
    each do |todo|
      todo.undone!
    end
  end
  alias_method :mark_all_undone, :undone!

  def done?
    todos.all? { |todo| todo.done? }
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list << todo if yield(todo)
    end
    list
  end

  # returns first todo by title or nil if no match
  def find_by_title(title)
    each do |todo|
      return todo if todo.title == title
    end
    nil
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done?} 
  end

  def mark_done(str)
    each do |todo|
      todo.done! if str == todo.title
    end
  end

  def to_s
    text = "---- Today's Todos ----\n"
    text << todos.map(&:to_s).join("\n")
  end

  def to_a
    todos
  end
end