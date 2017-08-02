#recreate the times method 

# def times(number)
#   count = 0
#   while count > number
#     yield(number)
#   end
#   number
# end

# 5.times do |num|
#   puts num
# end

#recreate the each method
# def each(array)
#   count = 0
#   p size = array.size
#   while size > count
#     yield(array[count])
#     count += 1
#   end
#   array
# end

# [1, 2, 3].each { |num| "do nothing" }

#iterate through the whole array. 
#pass the block in
#if the value is truthy, include it into a new array
# def select(array)
#   count = 0
#   new_array = []
#   while (array.size > count)
#     new_array << array[count] if yield(array[count])
#     count += 1
#   end
#   new_array
# end

# array = [1, 2, 3, 4, 5]
# p select(array) { |num| num.odd? }      # => [1, 3, 5]


#################################
## reproduce the reduce method ##
#################################
# def reduce(array, operator=0)
#   sum = operator
#   count = 0
#   while (array.size > count)
#     sum = yield(sum, array[count])
#     count += 1
#   end
#   sum
# end

# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# reduce(array, 10) { |acc, num| acc + num }                # => 25
# # reduce(array) { |acc, num| acc + num if num.odd? } 

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

  def item_at(index)
    if index > size
      STDERR.puts "#(Index Outofbounds)"
    else
      @todo[index]
    end
  end

  def mark_done_at(index)
    if index > size
      STDERR.puts "#(Index Outofbounds)"
    else
      @todo[index].done!
    end
  end

  def mark_undone_at(index)
    if index > size
      STDERR.puts "#(Index Outofbounds)"
    else
      @todo[index].undone!
    end
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

  def each
    count = 0
    while (@todo.size > count)
      yield(@todo[count])
      count += 1
    end
    @todo
  end

  def to_s
    p "---- Today's Todos ----"
    @todo.each do |item|
      p item.to_s
    end
  end
end

class Todo
  MARKDONE = "X"
  UNMARK = " "
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

# given
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

