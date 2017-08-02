require 'Time'

module Payload
	WEIGHT_STANDARD = 500
	attr_accessor :number_of_wheels, :weight

	def payload_calc(number_of_wheels, weight)
		weight < number_of_wheels * WEIGHT_STANDARD ? true : false
	end
end

class Vehicles

	@@vehicle_count = 0
	attr_reader :model, :year
	attr_accessor :color, :speed

	def initialize(model, year, color, speed)
		@model = model
		@year = year
		@color = color
		@speed = speed
		@on = false
		@ignition = "off"
		@@vehicle_count += 1
	end

	def age
		puts "Your #{self.model} is #{years_old} years old"
	end

	def self.mpg(milage, gallons)
		p "#{milage/gallons} miles per gallon"
	end

	def class_info
		p "#{@@vehicle_count} number of objects have been created"
	end

	def accelerate(number)
		self.speed += number
	end

	def brake(number)
		self.speed -= number
	end

	def on_off
		@speed = 0
	end

	def spray_paint(color)
		self.color = color
		puts "Your new #{color} paint job looks terrible! Don't waste your money"
	end

	def self.mpg(milage, gallons)
		mpg = (milage/gallons)
		puts "This car gets #{mpg} miles per gallon"
	end

	private

	def years_old
		t = Time.new
		t.year - @year
	end
end

class Mytruck < Vehicles
	CARGO_LOAD = 1000 #Those things that 18 wheelers carry
	include Payload
end

class Mycar < Vehicles
	def to_s
		"You're driving a #{model} that was made in #{year} with a beautiful cream #{color} color, cruzing #{speed} mph."
	end
end

# tesla = Mycar.new("Model S", 2012, "steel blue", 0)
# Mycar.mpg(100, 12)


class Student
	def initialize (name, grade)
		@name = name
		@grade = grade
	end

	def better_grade_than?(student_name)
		student_name.grade < grade
	end

	protected

	def grade
		@grade
	end
end

bhavik = Student.new("bhavik", 75)
eddie = Student.new("eddie", 80)

puts "yup" if eddie.better_grade_than?(bhavik)



