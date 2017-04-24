SQMETERS_TO_SQFT = 10.7639 # defining converstions and known numbers like pie as a constant is good practice.

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

#