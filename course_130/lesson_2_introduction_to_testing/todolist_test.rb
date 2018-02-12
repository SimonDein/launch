require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error_when_wrong_type_is_entered_into_list
    assert_raises(TypeError) { @list.add("Hi")}
    assert_raises(TypeError) { @list.add(1)}
  end

  def test_shovel_operator
    new_todo = Todo.new('Get the dog at the kennel')
    @list << new_todo
    @todos << new_todo
    
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new('Get the dog at the kennel')
    @list.add(new_todo)
    @todos << new_todo
    
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(30)}
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(8)}
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(20)}
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(20)}

    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output =
    <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s) # tests ouput when no todos are done

    output =
    <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [X] Clean room
      [ ] Go to gym
    OUTPUT
    @list.item_at(0).done!
    @list.item_at(1).done!
    assert_equal(output, @list.to_s) # tests output when todos are done
  end

  def test_each
    index = 0
    @list.each do |todo|
      assert_equal(@list.item_at(index), todo)
      index += 1
    end

    assert_same(@list, @list.each { |todo| nil }) # nil is placeholder
  end

  def test_select
    result = @list.select { |todo| todo.title == 'Buy milk'}
    assert_instance_of(TodoList, result)
    
    refute_same(@list, result) # nil is placeholder
  end
end