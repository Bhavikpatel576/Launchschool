#Welcome stranger
def greetings(array, hash)
	p "It's nice to have #{array.join(" ")} join us. You're a #{hash[:title]}"
end

#Double Doubles
def twice(number)
	num_to_s = number.to_s
	len = num_to_s.size
	if num_to_s[0,(len/2)] == num_to_s[(len/2)..len]
		num_to_s.to_i
	else
		num_to_s.to_i * 2
	end
end

#counting up
def sequence(number)
	1.upto(number).map {|x| x}
end

#uppercase check
def uppercase?(string)
	test_string = string.upcase
	return true if string == test_string
	return false
end
#name swapping
def swap_name_2(string)
	string = string.split(' ')
	string[0], string[1] = string[1], string[0]
	string[0].concat(',') + ' ' + string[1]
end

def swap_name(string)
	string.split(' ').reverse.join(', ')
end

#sequence count
def sequence(elements, multiple)
	1.upto(elements).map do |x|
		x * multiple
	end
end

#grade book

def get_grade(num1, num2, num3)
	average = (num1 + num2 + num3) / 3
	case
	when average >=  90 then 'A'
	when average >=  80 then 'B'
	when average >=  70 then 'C'
	when average >=  60 then 'D'
	else 
		'F'
	end
end

p get_grade(70,90,80)

#grocery list

def buy_fruits(array)
	new = []
	array.map do |x|
		x[1].times do |_|
			new << x[0]
		end
	end
	new
end

p buy_fruits([["apple",3],["orange", 4]])















