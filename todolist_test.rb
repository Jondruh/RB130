require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
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
    refute(@list.done?)
    @todos.each { |todo| todo.done = true }
    assert(@list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add("hi") }
  end

  def test_shovel
    @todo4 = Todo.new("Shop")
    all_todos = [@todo1, @todo2, @todo3, @todo4]
    assert_equal(all_todos, @list.<<(@todo4))
  end

  def test_add
    @todo4 = Todo.new("Shop")
    all_todos = [@todo1, @todo2, @todo3, @todo4]
    assert_equal(all_todos, @list.add(@todo4))
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, false)
    assert_raises(IndexError) {@list.mark_done_at(5)}
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(5)}

    @todo1.done = true
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, false)
    @list.mark_undone_at(0)
    assert_equal(@todo1.done?, false)
    assert_equal(@todo2.done?, false)
  end
    
  def test_done!
    assert_equal(@todo1.done?, false)
    assert_equal(@todo2.done?, false)
    assert_equal(@todo3.done?, false)

    @list.done!

    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, true)
    assert_equal(@todo3.done?, true)
  end

  def test_remove_at
    @list.remove_at(2)
    assert_equal([@todo1, @todo2], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(100) }
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_some_done
    @list.mark_done_at(0)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.mark_all_done

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end

  def test_all_done
    assert_equal(TodoList.new.to_a, @list.all_done.to_a)
    @todo1.done!

    assert_equal((TodoList.new << @todo1).to_a, @list.all_done.to_a)
  end

  def test_each_iteration
    @list.each { |todo| todo.done = true }
    assert_equal(3, @list.all_done.size)
  end

  def test_each_return
    each_return = @list.each { |todo| nil }
    assert_same(@list, each_return)
  end

  def test_select
    assert_equal(@list.to_a, @list.select { |todo| true }.to_a)

    @list.mark_done_at(0)
    
    assert_equal([@todo1], @list.select { |todo| todo.done?}.to_a)
    refute_same(@list, @list.select { |todo| true } )
  end

  def test_all_not_done
    @todo1.done!
    assert_equal([@todo2, @todo3], @list.all_not_done.to_a)
  end

  #def test_find_by_title
  #  assert_equal(nil, @list.find_by_title("hi"))
  #  assert_equal(@todo1, @list.find_by_title("Buy milk"))
  #end

  def test_mark_done
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
  end

end