#Rotation
require 'pry'

def rotate_array(array)
	len = array.size
	temp = array.shift
	array[len - 1] = temp
	array
end

def rotate_array2(array)
	array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(number)
	len = number.to_s.size
	len.downto(2) do |x|
		p x
		p number = rotate_rightmost_digits(number,x)
	end
	number
end


def toggle_on_off(lights)
	iterations = lights
	flag = true
	switches = {}
	(1..iterations).map do |x|
		switches[x] = flag
	end
	(2..iterations).select do |x|
		flag = !flag
		(2..iterations).select do |multiple|
			if multiple % x == 0
				switches[multiple] = !switches[multiple]
			end
		end
	end
	switches
end

def light_on(hash)
	hash.keys.select do |x| 
		if hash[x] == true
			hash[x]
		end
	end
end

#numbers are always odd
#the first row will have one star placed in the middle
#example (5) => 3rd row will have 5 stars, all rows have 5 elements

def print_row(grid_size, distance_from_center)
	stars = grid_size - 2 * distance_from_center
	num = '*' * stars
	puts num.center(grid_size)
end

def diamond(grid_size)
 first_half = (grid_size - 1) / 2
 first_half.downto(0) {|distance| print_row(grid_size, distance)}
 1.upto(first_half) {|distance| print_row(grid_size, distance)}
end

#parase the input -> PUSH COMMAND is the only one that has a value
#Create a stack 

def minilang(input)
	stack = Array.new
	register = 0
	input.split.each do |x|
		case x
		when 'PUSH' then stack.push(register)
		when 'ADD' then register += stack.pop
		when 'SUB' then register -= stack.pop
		when 'MULT' then register *= stack.pop
		when 'DIV' then register /= stack.pop
		when 'MOD' then register %= stack.pop
		when 'POP' then register = stack.pop
		when 'PRINT' then p register
		else
			register = x.to_i
		end
	end
	register
end

def word_to_digit2(string)
	value_hash = {'zero' => 0, 'one' => 1, 'two'=> 2, 'three'=> 3, 'four'=> 4, 'five'=> 5, 'six'=> 6, 'seven'=> 7, 'eight'=> 8, 'nine'=> 9}
	new_string = string.split.map do |word|
		if value_hash[word]
			value_hash[word].to_s
		else
			word
		end
	end
	new_string.join(" ")
end

def word_to_digit(string)
	value_hash = {'zero' => 0, 'one' => 1, 'two'=> 2, 'three'=> 3, 'four'=> 4, 'five'=> 5, 'six'=> 6, 'seven'=> 7, 'eight'=> 8, 'nine'=> 9}
	value_hash.keys.each do |key|
		string.gsub!(/\b#{key}\b/, value_hash[key].to_s)
	end
	string
end

def fibonacci1(number)
	if number == 1 
		return 1
	end
	return 1 if number == 2
	fibonacci(number - 1) + fibonacci(number - 2)
end

def fibtonacci2_bhav(number)
	if number <=2 
		return 1
	end
	one = 1
	two = 1
	fib = 0
	1.upto(number) do |x|
		one = two
		two = fib
		fib = one + two
	end
	fib
end

def fibonnacii2(number)
	first, last = [1,1]
	3.upto(number) do 
		first, last = [last, first + last]
	end
	last
end

def fibonnacii3(number)
	number = fibonnacii2(number)
	number.to_s[-1].to_i
end

def fibonnacii_last(nth)
	last_2 = [1,1]
	3.upto(nth) do 
		last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
	end
	last_2.last
end

p fibonnacii_last(100)



