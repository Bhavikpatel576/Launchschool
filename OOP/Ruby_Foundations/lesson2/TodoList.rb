SimpleCov.start
require 'simplecov'

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todo = []
  end

  def <<(object)
    raise TypeError, 'can only add Todo objects' unless object.instance_of? Todo
    @todo << object
  end
  alias_method :add, :<<

  def size
    @todo.size
  end

  def first
    @todo.first
  end

  def last
    @todo.last
  end

  def to_a
    @todo
  end

  def item_at(idx)
    @todo.fetch(idx)
  end

  def mark_done_at(index)
    @todo.fetch(index).done!
  end

  def mark_undone_at(index)
    @todo.fetch(index).undone!
  end

  def shift
    @todo.shift
  end

  def pop
    @todo.pop
  end

  def remove_at(index)
    if index > size
      STDERR.puts "#(Index Outofbounds)"
    else
      @todo.delete_at(index)
    end
  end

  #not sure exactly why we return self instead of just using @todo
  #isn't that the same thing?
  def each 
    @todo.each do |item|
      yield(item)
    end
    self
  end

  def select
    list = TodoList.new
    count = 0
    each do |item|
      list.add(item) if yield(item)
    end
    list
  end

  def to_s
    p "---- Today's Todos ----"
    @todo.each do |item|
      p item.to_s
    end
  end

  def find_by_title(title)
    select { |list| list.title == title }.first
  end

  def all_done
    select { |list| list.done? }
  end

  def all_not_done
    select { |list| !list.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |list| list.done! }
  end

  def mark_all_undone
    each { |list| list.undone! }
  end

  def done?
    @todo.all? { |todo| todo.done? }
  end

  def done!
    each { |list| list.done! }
  end

  def test_to_s_2
    output = <<-OUTPUT.gets.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
end

class Todo
  MARKDONE = 'X'
  UNMARK = ' '
  attr_accessor :done, :item, :description, :title

  def initialize(title, decription='')
    @title = title
    @decription = decription
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    self.done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? MARKDONE : UNMARK}]: #{title}"
  end
end

# # given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo
end


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
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_s)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_s)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_raise_initialize_with_arg
    assert_raises(TypeError) {@list.add(1)}
    assert_raises(TypeError) {@list.add("yellow")}
  end

  def test_shovel
    #test to see if it adds to Todolist.
    @todo4 = Todo.new("something")
    @todos << @todo4
    @list << (@todo4)
    assert_equal(@todos, @list.to_s)
  end

  def test_add_alias
    #test to see if it adds to Todolist.
    @todo4 = Todo.new("something")
    @todos << @todo4
    @list.add(@todo4)
    assert_equal(@todos, @list.to_s)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) {@list.item_at(100)}
  end

  def test_mark_done_at
    # @todo2.undone!
    assert_equal(false, @todo2.done?)
    assert_equal(true, @list.mark_done_at(1))
    assert_raises(IndexError) {@list.mark_done_at(100)}
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_raises(IndexError) {@list.mark_undone_at(100)}
  end

  def test_done
    @todo1.undone!
    @todo2.undone!
    @todo3.undone!

    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  # Your tests go here. Remember they must start with "test_"

end

