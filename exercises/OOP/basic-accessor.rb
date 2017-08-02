
#version 1
class Person
	attr_accessor :name
end

# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name

# #version 2
# class Person
# 	def name=(value)
# 		@name = value
# 	end
# end

# class Person
# 	attr_reader :phone_number

# 	def initialize(number)
# 		@phone_number = number
# 	end
# end

# person1 = Person.new(123456789)
# puts person1.phone_number

# person1.phone_number = 97654321
# puts person1.phone_number

# class Person
# 	attr_accessor :first_name
# 	attr_writer :last_name

# 	def first_equal_last?
# 		first_name == last_name
# 	end

# 	private

# 	attr_reader :last_name
# end

# person1 = Person.new
# person1.first_name = 'Dave'
# person1.last_name = 'Smith'
# puts person1.first_equal_last?

# puts person1.first_name
# # puts person1.last_name

# class Person
# 	attr_reader :name
# 	attr_writer :age

# 	def name=(name)
# 		@name = name.capitalize
# 	end

# 	def older_than?(other)
# 		age > other.age
# 	end

# 	protected 

# 	attr_reader :age
# end

# person1 = Person.new
# person1.age = 17
# person2 = Person.new
# person2.age = 26
# puts person1.older_than?(person2)

# person1 = Person.new
# person1.name = 'eLiZabeth'
# puts person1.name


#Modified code so @name is not modified from outside the method via a destructive method call. 
# class Person
# 	def initialize(name)
# 		@name = name
# 	end

# 	def name
# 		@name.clone
# 	end
# end

# person1 = Person.new("james")
# person1.name.reverse!
# puts person1.name

# person2 = Person.new("bhavik")
# person2.name.reverse!
# puts person2.name

#calculate the age. multiply the instance variable by 2 and then again by 2 whne @age is returned by the getter method
# class Person
# 	def age=(age)
# 		@age = age * 2
# 	end

# 	def age
# 		@age * 2
# 	end
# end

# class Person_v2
# 	def age=(age) #setter method
# 		@age = double(age)
# 	end

# 	def age
# 		@age = double(@age)
# 	end

# 	private

# 	def double(value)
# 		value * 2
# 	end
# end

# person2 = Person.new
# person2.age = 20 
# puts person2.age

class Person
	attr_accessor :name

	# def name=(name)
	# 	@name = name.split()
	# 	@first_name = @name[0]
	# 	@last_name = @name[1]
	# end

	def name=(name)
		@first_name, @last_name = name.split()
	end

	def name
		"#{@first_name} #{@last_name}"
	end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name











































