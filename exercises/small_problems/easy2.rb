SQMETERS_TO_SQFT = 10.7639 # defining converstions and known numbers like pie as a constant is good practice.

#Mutation 
#array2 is populated with object ids from array 1
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2


# #>> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

p 'Please enter an integer greater than 0'
num = gets.chomp.to_i
p "Enter 's' to compute the sum, 'p' to compute the product"
choice = gets.chomp.to_s.downcase

def sum_array(num, choice)
	total = 0
	1.upto(num) {|x| total+=x}
	total
end

def mult_array(num, choice)
	total = 1
	1.upto(num) {|x| total*=x}
	total
end

return_value = 0
if choice == 's'
	return_value = sum_array(num, choice)
else 
	return_value = mult_array(num, choice)
end

p return_value

#when will i retire?
t = Time.new
p 'What is your age'
age = gets.chomp.to_i
p "At what age would you like to retire?"
retire_age = gets.chomp.to_i
retirement_year = t.year + retire_age - age

p "It's '#{t.year}' and you'll retire in '#{retirement_year}'"
p "You have #{retire_age - age} years to go"

#implement a tip calculator
#ask for the bill 
#ask for the tip percentage


p 'what is the total bill amount?'
bill = gets.chomp.to_f
p 'what is the tip percetage (enter as decimal)'
tip_pct = gets.chomp.to_f

tip_amt = bill * tip_pct
tot_bill = (tip_amt + bill).round(2)
p "Your total bill is #{tot_bill}"

how big is the room?
p 'Enter the length of the room in meters'
length_meters = gets.chomp.to_i
p 'Enter the width of the room in meters'
width_meters = gets.chomp.to_i
p "The area of the room in square meters is '#{length_meters * width_meters}' and the square ft is '#{(length_meters * width_meters * SQMETERS_TO_SQFT).round(2)}'"

#build a program that randomly generates and prints Teddy's age
age_teddy = rand(20..200)
p "Teddy is #{age_teddy} years old"














