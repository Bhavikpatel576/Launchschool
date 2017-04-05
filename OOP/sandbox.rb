class GoodBoy
	attr_accessor :name, :height, :weight

	def say_name
		name
	end

	def initialize(n,h,w)
		@name = n
		@height = h
		@weight = w 
	end

	#method to return a speak

	def speak
		"#{name} wants to go outside"
	end

	def change_info(n = @name,h,w) #testing to see how defaults would work
		@name = n
		@height = h
		@weight = w 
	end

	def info
		"#{name} is #{height} tall and he weights #{weight} pounds"
	end
end

# dog1 = GoodBoy.new("Roscoe", '2ft', '35')
# p dog1.info

# dog1.change_info("dougie", "3ft", '35')
# p dog1.info


class Mycar
	attr_accessor :year, :color, :model, :speed
	attr_reader :ls
	

	#instance variable for speed set to zero during init
	#instance methods that allow speed to increase, brake, and shut off 

	def initialize (y,c,m)
		self.year = y
		self.color = c
		self.model = m
		self.speed = 0
	end

	def speedUp (mph)
		@speed += mph
		p "current car speed is #{@speed}"
	end

	def brake (mph)
		@speed -= mph
		p "current car speed is #{@speed} after breaking #{mph}"
	end

	def shutdown
		@speed = 0
		"car has been shut down and is running at #{speed} mph"
	end
end

stacyspeeds = Mycar.new('2016', 'black', 'new')
stacyspeeds.speedUp(60)
p stacyspeeds.shutdown