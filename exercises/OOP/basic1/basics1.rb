def problem1
  puts "hello".class
  puts 5.class
  puts [1,2,3].class
end

module Walkable

  def walk
    puts "Let's go for a walk!"
  end

end

class Cat
  include Walkable
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello my name is #{@name}!"
  end

end




kitty = Cat.new('cat kitty')
kitty.name = "lune"
kitty.walk