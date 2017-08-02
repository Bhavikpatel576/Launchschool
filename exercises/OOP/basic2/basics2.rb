
# Exercise 1: something to note here is the invocation of #generic_greeting is of the Cat class and not an instance of an object. 
# in order for us to make this work, we had to create a class method using .self + method_name
# class Cat
# 	def self.generic_greeting
# 		puts "Hello i'm a cat!"
# 	end
# end

# kitty = Cat.generic_greeting


#Exercise 2: When invoking setter methods, they must be denoted with self. We're required to use self so that Ruby knows the difference 
#between initializing a local variable and invoking a setter method.

#comments: is this the case? Below I was able to use an instance variable of the object and reassign it with the rename method.
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#   	@name = new_name
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def identify
#   	self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify


class Cat
  attr_reader :name, :color
  @@total_objects = 0

  def initialize(name, color)
    @name = name
    @color = color
    @@total_objects += 1
  end

  # Here, we define #to_s to return I'm Sophie!, so puts kitty prints I'm Sophie!. 
  # In fact, #to_s returns I'm Sophie! for every Cat object, and puts will print the 
  # same thing for every Cat object we pass to it.

  def to_s
  	"Hi, my name is #{@name} the #{@color} cat"
  end

  def self.total
  	@@total_objects
  end

  def self.generic_greeting
  	puts "Hello i'm a cat"
  end

  def personal_greeting
  	puts "Hello, my name is #{@name}"
  end

end


# class Person
# 	attr_accessor :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

class Person
  attr_writer :secret

  def print_secret
  	puts secret
  end

  def compare_secret(person)
  	person.secret == self.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)

person1.print_secret
person2.print_secret



















