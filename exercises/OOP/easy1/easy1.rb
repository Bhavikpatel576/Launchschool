# class Banner
# 	def initialize(message)
# 		@message = message
# 	end

# 	def to_s
# 		[horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
# 	end

# 	private

# 	def horizontal_rule
# 		dash = "-" * @message.size
# 		"+-#{dash}-+"
# 	end

# 	def empty_line
# 		spaces = " " * @message.size
# 		"| #{spaces} |" 
# 	end

# 	def message_line
# 		"| #{@message} |"
# 	end
# end


# banner = Banner.new('Joey the boxer')
# puts banner

#Discussion:The original version of #to_s uses String#upcase! which mutates 
#its argument in place. This causes @name to be modified, which in turn causes 
#name to be modified: this is because @name and name reference the same object
#in memory.

# class Pet
# 	attr_reader :name

# 	def initialize(name)
# 		@name = name.to_s
# 	end

# 	def to_s
# 		"My name is #{@name.upcase}."
# 	end
# end

# # name = "Fluffy"
# # fluffy = Pet.new(name)
# # puts fluffy.name
# # puts fluffy
# # puts fluffy.name
# # puts name


# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name


# class Book
# 	attr_accessor :title, :author

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

#this problem looks like it doesn't include a proper setter method
# class Person

#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def first_name=(first_name)
#   	@first_name = first_name.capitalize
#   end

#   def last_name=(last_name)
#   	@last_name = last_name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     @mileage += miles
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678


class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
	def initialize(side)
		super(side,side)
	end
	# my answer
	# def initialize(side)
	# 	@height = side
	# 	@width = side
	# end
end


square = Square.new(5)
#puts "area of square = #{square.area}"

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
	def initialize(name, age, color)
		super(name,age)
		@color = color
	end


	 def to_s
  	"My cat #{@name} is #{@age} years old and has a beautiful #{@color} color coat"
  end
end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch


class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{@make} #{@model}"
  end
end

class Car < Vehicle
	def wheels
		4
	end
end

class Truck < Vehicle
	attr_reader :payload
	def initialize(make, model, payload)
		super(make, model)
		@payload = payload
	end
	
	def wheels
		6
	end
end

class Motorcycle < Vehicle
	def wheels
		2
	end
end

car1 = Car.new("Toyota", "Camery")
puts car1
puts car1.wheels




