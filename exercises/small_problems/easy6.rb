DEGREEMINUTES = 60
DEGREESECONDS = 60
DEGREE = "\x00\xB0"
VOWELS = %w(a e i o u A E I O U)
#cut angles
def dms(number)
	degrees = number.floor
	minutes = number % 1 * DEGREEMINUTES
	seconds = minutes % 1 * DEGREESECONDS
	format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

#delete vowels
def remove_vowels(string)
	string.map do |element|
		element.chars.select do |c|	
			c unless VOWELS.include?(c)
		end.join()
	end
end

#Fibonacci
#1,1,2,3,5,8
#calculate the fib number
#return index based off length of input
def find_fibonacci_index_by_length(value)
	first_num = 1
	second_num = 1
	index = 2
	loop do 
		fib = first_num + second_num
		index +=1 
		return index if fib.to_s.size == value
		first_num = second_num
		second_num = fib
	end
end

#mutate Reversed Array
def revarray!(array)
	len = array.length - 1
	index = 0
	while (array.length / 2 > index)
		temp = array[len]
		array[len] = array[index]
		array[index] = temp
		len -= 1
		index +=1
	end
	array
end

def revarray_answer(array)
	left_index = 0
	right_index = -1
	while (left_index < array.size/2)
		array[left_index], array[right_index] = array[right_index], array[left_index]
		left_index += 1
		right_index -= 1
	end
	array
end

#Reversed Array 2
def rev_array(array)
	rev_array = []
	len = array.length - 1
	while (len >= 0)
		rev_array << array[len]
		len -= 1
	end
	rev_array
end

#Combining Arrays
def merge (array1, array2)
	array1 << array2
	array1.flatten.uniq!
end

def merge2(array1, array2)
	array1 | array2 
end

#Halvsies

def halvsies(array)
	first_half = array.slice(0,(array.size/2.0).ceil)
	second_half = array.slice(first_half.size,(array.size))
	[first_half, second_half]
end
#find the doup
def find_dup2(array)
	iterations = array.size
	pos = 0
	while (iterations > pos)
		array.each_with_index do |elem, index| 
			if elem == array[pos] && (index != pos)
				return elem
			end
		end
		pos += 1
	end
end

def find_dup(array)
	array.find {|element| array.count(element) == 2}
end

#does my list include this
def includ?(array, value)
	array.each do |element|
		if element == value
			return true
		end
	end
	false
end

#use the find index to determine if the value returns an index value
#double bang to return true if the method returns a valid value
#returns false if nothing appears
def includ_answer(array,value)
	!!array.find_index(value)
end

#Right Triangle

def triangle(value)
	star = 1
	spaces = value - star
	index = value
	while (index > 0)
		puts " "* spaces + '*'*star
		star += 1
		spaces -=1
		index -= 1
	end
end

triangle(5)
































