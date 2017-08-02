# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
# end

# class Car < Vehicle
# end


# truck1 = Truck.new(1994)
# puts truck1.year

# car1 = Car.new(2006)
# puts car1.year


# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#     start_engine
#   end

#   def start_engine
#   	puts "Ready to go in the vehicle method"
#   end

# end

# class Truck < Vehicle
#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# vehicle = Vehicle.new(2033)

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
# 	attr_reader :bed_type
# 	def initialize(year, bed_type)
# 		super(year)
# 		@bed_type = bed_type
# 	end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'Short')
# puts truck1.year
# puts truck1.bed_type

# module Towable
# 	def tow
# 		puts "I can tow a vehicle"
# 	end
# end

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#   	@year = year
#   end

#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   include Towable
#   def start_engine(speed)
#     super() + " Drive #{speed} please!"
#   end
# end

# truck1 = Truck.new(3023)
# puts truck1.start_engine('fast')
# truck1.tow

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# cat1.class


module Transportation
	class Vehicle
	end

	class Truck < Vehicle
	end

	class Car < Vehicle
	end
end

#instantiation example
#Transportation::Truck.new
