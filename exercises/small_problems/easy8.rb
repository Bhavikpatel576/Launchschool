#sum of sums
def sum_of_sums(array1)
	len = array1.size
	total = 0
	len.times do |x|
		array1.slice(0..x).each do |x|
			total += x
		end
	end
	total
end

#Leading Substrings
# 'abc' -> a, ab, abc
# 'xyzzy' -> x, xy, xyz, xyzz, xyzzy
def substrings_at_start(string)
	len = string.length
	new_array = []
	character = string.chars
	len.times do |x|
		new_array << character.slice(0..x).join("")
	end
	new_array
end

def substrings_at_start_2(string)
	n_array = 1.upto(string.size).map do |count|
		string.chars.slice(0..count).join("")
	end
	n_array
end

#All Substrings
def substrings(string)
	new_array = 0.upto(string.size).map do |beg|
		beg.upto(string.size - 1).map do |count|
			string.chars.slice(beg..count).join("")
		end
	end
	new_array.flatten
end

#Palindromic Substrings
def palindromes(string)
	pals = []
	substrings = substrings(string)
	substrings.each do |words|
		if words == words.reverse && words.size > 1
			pals << words
		end
	end
	pals
end

#fixxbuzz

def fizzbuzz(num1, num2)
	num1.upto(num2).each do |x|
		if x % 3 == 0 && x % 5 == 0
			print "fizzbuzz"
		elsif x % 3 == 0
			print "fizz,"
		elsif x % 5 == 0
			print "buzz,"
		else
			print "#{x},"
		end
	end
end


#Double Char(part1)

def double_consonants(string)
	characters = string.chars
	vowels = %w(a e i o u)
	result = characters.map do |e|
		e * 2
	end
end

#Double Char(part 2)
def double_consonants(string)
	characters = string.chars
	vowels = %w(a e i o u)
	result = characters.map do |e|
		if vowels.include?(e)
			e
		else
			e * 2
		end
	end
	result.join("")
end

#convert number to reversed array of digits

def reversed_number(number)
	number.to_s.reverse.to_i
end

#Get the middel character

def center_of(string)
	len = string.length
	if len.odd?
		string[len/2]
	else
		string[len/2 - 1, 2]
	end
end

p center_of('Launch')