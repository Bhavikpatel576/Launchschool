require 'pry'

a = [1,2,3,4]
a << 5
#binding.pry. <--lldb like thing
puts a 

s1 = 'bhavik'
s2 = 'patel'
puts s1 + s2

puts 'Find multiple placements for the number 1,234'

num = 1234
ones = 1234 % 10 
tens = num % 100 / 10
hundreds = num % 1000 / 100
thousands = num % 10000 / 1000

puts "num: #{num} , ones: #{ones}, tens: #{tens}, hundredes: #{hundreds}, thousands: #{thousands}"

puts "-----movie hash table------"

movie_hash = {:gonein60seconds => 1975, :jurassicpark2 => 2004, :movie3 => 2013, :movie4 => 2001}
puts movie_hash[:gonein60seconds] 
puts movie_hash[:movie3]

array = [movie_hash[:gonein60seconds], movie_hash[:movie3]]
puts array

=begin

independent problem : loop through the hash table and create an array out of the key values 
in the table

movie_hash.each do |key, value|
	array2 = Array.new(2)
	array2 << value 
end

puts array2

=end

# print " "
# puts "---------Variables exercises---------"
# print " "
# puts "What is your name?"
# name = gets.chomp
# puts "You mother f'er! it's good to see you #{name}"
# print ' '
# puts "How old are you"
# age = gets.chomp.to_i
# puts "in 10 years you will be"
# puts age + 10 
# puts "in 20 years you will be"
# puts age + 20 
# puts "in 30 years you will be"
# puts age + 30 
# puts "in 40 years you will be"
# puts age + 40 




puts "---------Methods exercises---------"

def scream(words)
	words = words + "!!!!"
	return words
end

word = "test"
word = scream("test")
puts word

def multiple(a,b)
	a*b
end

def string_len(string)
	if string.length > 10
		string
	else
		string.upcase 
	end
end

puts "enter a word and see what will be returned"
x = gets.chomp.to_s
puts string_len(x)


def eval_num(number)
	if num <= 50 
		puts "between 0 and 50"
	elsif num >=51 && num <= 100
		puts "between 51 and 100"
	else 
		puts "larger than 100"
	end
end

def eval_num_case(number)
	case
	when number < 0
		puts 'enter a positive number'
	when number <= 50 
		puts "between 0 and 50"
	when number <= 100 && number >50
		puts "between 51 and 100"
	when number > 100
		puts "greater than 100"
	end
end

def eval_num_case_2(number)
	answer = case
	when number < 0
		'enter a positive number'
	when number <= 50 
		"between 0 and 50"
	when number <= 100 && number >50
		"between 51 and 100"
	when number > 100
		"greater than 100"
	end
	puts answer
end

puts "test the case method: enter a number"
x = gets.chomp.to_i
eval_num_case_2(x)

# loop do 
# 	x = gets.chomp
# 	if x == 'STOP'
# 		break
# 	end
# 	puts x
# end

def count_down(number)
	if number <= 0
		puts number
	else 
		puts number
		number -= 1
		count_down(number)
	end
end

puts "Enter number for recursion"
x = gets.chomp.to_i
count_down(x)


