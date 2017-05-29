a1 = [2,4]
a2 = [4,3,1,2]
#combine two lists
def interleave(a1, a2)
	new_array = []
	index = [a1.size, a2.size].max
	index.times do |x|
		new_array << a1[x]
		new_array << a2[x]
	end
	new_array
end

def interleave2(a1, a2)
	new_array = []
	a1.each_with_index do |value, index|
		new_array << value << a2[index]
	end
	new_array
end

#Lettercase Counter

def lettercasecount(string)
	count = {lowercase: 0, uppercase: 0, neither: 0}
	count[:lowercase] = string.chars.count {|char| char =~ /[a-z]/}
	count[:uppercase] = string.chars.count {|char| char =~ /[A-Z]/}
	count[:neither] = string.chars.count {|char| char =~ /[^A-Za-z]/}
	count
end

#Capitilize Words
def word_cap2(string)
	string.split(" ").map {|word| word.capitalize}.join(" ")
end

def word_cap(string)
	string.split(" ").map(&:capitalize).join(" ")
end

#Swap Case
def swapcase(string)
	characters = string.chars
	new_string = characters.map do |char|
		if char =~ /[a-z]/
			char.upcase!
		elsif char =~ /[A-Z]/
			char.downcase
		else
			char
		end
	end
	new_string.join("")
end

#Staggered Caps
def staggered_case(string)
	new_string = string.chars.map.with_index do |char, x|
			if x.even?
				char.upcase!
			else
				char.downcase!
			end
			char
		end
	new_string.join("")
end

#Staggered caps (part 1)
def staggered_case_1(string)
	flag = true
	new_string = string.chars.map do |char|
		if char =~ /[A-Za-z]/
			if flag
				char.upcase!
			else
				char.downcase!
			end
			flag = !flag
			char
		else
			char
		end
	end
	new_string.join("")
end

#multiplicative Average
def show_mutiplicative_average(array)
	total_value = 1
	array.each do |value|
		total_value *= value
	end
	format('%.3f',(total_value.to_f/array.size))
end

#multiply lists
def multiply_list(array1, array2)
	new_array = []
	array2.size.times do |x|
		new_array << array1[x] * array2[x]
	end
	new_array
end

#multiply all pairs

def multiply_all_pairs(array1, array2)
	array1.product(array2).map {|a,b| a*b}.sort
end

#the end is near but not here
#return next to last word
def penultimate(string)
	array = string.split(" ")
	len = array.size
	array[len - 2]
end

p penultimate('launch school')
