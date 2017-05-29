BLOCK = %w(BO GT VI XK RE LY DQ FS ZM CP JW NA HU).freeze
ENDING = ['.', '!', '?']

def sentancelength
	test = File.open("./text2.txt", "r")
	content = test.read
	sentances = content.split(/['?.!']/)
	length_max = 0
	index_max = 0
	sentances.each_with_index do |sentance, idx|
		length = sentance.split.count
		length_max, index_max = length, idx if length > length_max
	end
	p length_max
	p index_max
	p sentances[index_max]
	test.close
end

def block_word?(sentance)
	BLOCK.each do |blk|
		return false if sentance.upcase.chars.include?(blk[0]) &&
		sentance.chars.include?(blk[1])
	end
	return true
end

def block_word_answer?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

#lettercase percentage ratio
def letter_percentages(string)
	hash = { lowercase: 0, uppercase:0, neither:0 }
	len = string.length
	upper = 0.0
	lower = 0.0
	neither = 0.0
	string.chars.each do |char|
		if char =~ /[A-Z]/
			upper += 1
		elsif  char =~ /[a-z]/
			lower += 1
		else
			neither +=1
		end
	end
	hash[:lowercase] = format("%0.2f",lower * 100 / len)
	hash[:uppercase] = format("%0.2f",upper * 100 / len)
	hash[:neither] = format("%0.2f",neither * 100 / len)
	hash
end

def letter_percentages_answer(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

#maching parenthese?

def balanced?(string)
	param = 0
	string.chars.each do |char|
		param += 1 if char == '('
		param -= 1 if char == ')'
		return false if param < 0
	end
	param.zero?
end

def bhav_balanced?(string)
	param_array = []
	string.chars.each do |character|
		if character == '('
			param_array << character
		elsif character == ')'
			param_array << character
		end
	end
	check_params(param_array)
end

def check_params(array)
	p array
	loop do
		return true if array.empty? 
		p array[0] 
		p array[-1]
		if array[0] == '(' && array[-1] == ')'
			array.pop
			array.shift
			p array
		else
			return false
		end
	end
end

#Triangle Slides
def triangle_sides(s1, s2, s3)
	array = [s1, s2, s3]
	max_side = array.max
	c = array.count {|elem| elem == 0}
	case
	when max_side > (array.reduce(:+) - max_side) then :invalid
	when c > 0 then :invalid
	when array.uniq.count == 1 then :equilateral
	when array.uniq.count == 2 then :isosceles
	else :scalene
	end
end

#Tri-Angles
def triangle(angle1, angle2, angle3)
	degrees = [angle1, angle2, angle3]
	case 
	when degrees.reduce(:+) != 180, degrees.include?(0) then :invalid
	when degrees.include?(90) then :right
	when degrees.count {|angle| angle > 90} >= 1 then :obtuse
	when degrees.count {|angle| angle < 90} > 2 then :acute	
	end
end

#Unlicky Days\
require 'date'
def friday_13th(year)
	unlucky_count = 0
	thirteenth = Date.new(year,1,13)
	12.times do 
		 unlucky_count += 1 if thirteenth.friday?
		thirteenth = thirteenth.next_month
	end
	unlucky_count
end

#Next featured number higher than a given value
#odd
#multiple of 7 
#digits occur exactly once
def featured(number)
	loop do
		number += 1
		odd_flag = number.odd?
		multiple_flag = number % 7 == 0
		unique_digits = number == number.to_s.chars.uniq.join.to_i
		break if odd_flag == true && multiple_flag == true && unique_digits == true
		return "to large" if number >= 9_876_543_210
	end
	number
end

def featured2(number)
	number += 1
	number +=1 until number.odd? && number % 7 == 0 
	loop do
		unique_digits = number == number.to_s.chars.uniq.join.to_i
		break if unique_digits == true
		number += 14
		return "to large" if number >= 9_876_543_210
	end
	number
end

#bubble sort
def bubble_sort!(array)
	len = array.size
	0.upto(len - 2) do |idx|
		0.upto(len - 2) do |idx|
		if (array[idx] > array[idx + 1])
			array[idx], array[idx + 1] = array[idx + 1],array[idx]
		end
	end
	end
	nil
end

#sum square
def sum_square_difference(number)
	num1 = number.downto(0).reduce(:+) ** 2
	num2 = 0
	number.downto(0) do |e| 
		num2 += e**2
	end 
	num1 - num2
end

p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150



































