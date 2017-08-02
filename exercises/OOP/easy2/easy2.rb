# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   attr_reader :name, :address, :city, :state, :zipcode
#   include Mailable
# end

# class Employee
#   attr_reader :name, :address, :city, :state, :zipcode
#   include Mailable
# end

# # betty = Customer.new 
# # bob = Employee.new
# # betty.print_address
# # bob.print_address

# module Drivable
#   def drive
#   	puts "test the drive method"
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# class House
#   attr_reader :price
#   include Comparable
#   def initialize(price)
#     @price = price
#   end

  #You're able to use the Comparable Mixin in order to do 
  #comparable values.
  # def <=>(other_object)
  # 	@price <=> other_object.price
  # end

  #My answer
  # def <(other_object)
  # 	@price < other_object.price
  # end

  # def >(other_object)
  # 	@price > other_object.price
  # end

# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# class Transform
# 	def initialize(string)
# 		@string = string
# 	end

# 	def to_s
# 		@string
# 	end

# 	def uppercase
# 		@string.upcase
# 	end

# 	def self.lowercase(string)
# 		string.downcase
# 	end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')


# class Something
#   def initialize
#     @data = 'Hello'
#   end
  
#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata
# puts thing.dupdata

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     @amount <=> other_wallet.amount
#   end

#   protected 

#   attr_reader :amount

# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)

# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end


# p bills_wallet.amount

##################### Try again ##########################################
# class Shelter
# 	def initialize
# 		@owner = {}
# 	end

# 	def adopt(owner, pet_name)
# 		owner.add_pets(pet_name)
# 		@owner[owner.name] ||=owner #whats going on with this syntax?
# 	end

#   def print_adoptions
#     @owner.each_pair do |name, owner|
#       puts "#{name} has adopted the following pets:"
#       owner.print_pets
#     end
#   end
# end

# class Owner
# 	attr_reader :name, :pets

# 	def initialize (name)
# 		@name = name
# 		@pets = []
# 	end

# 	def add_pets(pet_name)
# 		@pets << pet_name
# 	end

# 	def number_of_pets
# 		pets.size
# 	end

# 	def print_pets
# 		pets.each {|pet| p "A #{pet.type} named #{pet.name}"}
# 	end

# end

# class Pet
# 	attr_reader :type, :name
# 	def initialize(type, name)
# 		@type = type
# 		@name = name
# 	end

# 	def to_s
# 		"A #{@type} named #{@name}"
# 	end
# end


# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

#######################################################################

#the fix to this code is to either get rid of the self on expand or to change
#the expand method from private to protected 
#Private methods can never be called with an explicit reciever, even when it's 'self '
class Expander
  def initialize(string)
    @string = string
  end

  def to_s
 		expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

# expander = Expander.new('xyz')
# puts expander

module Movement
	def walk
		p "#{self} #{gait} forward"
	end
end


class Person
  include Movement
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
	include Movement
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
	include Movement
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
	include Movement
	attr_reader :name, :title

	def initialize(name, title)
		@name = name
		@title = title
	end

	def to_s
		"#{@title} #{@name}"
	end

	private

	def gait
		"struts"
	end
end

# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk

tomas = Noble.new("Tomas", "Lord")
tomas.walk












































