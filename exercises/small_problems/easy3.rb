def palindromic_number?(array)
	array.to_s == array.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true


def oddities_2(array)
	odd_arr = []
	idx = 0;
	while (idx < array.size)
		odd_arr << array[idx]
		idx+=2
	end
	odd_arr
end

def oddities(array)
	odd_arr = []
	array.each_with_index do |key, index|
		next if index.odd?
		odd_arr	<< key
	end
	odd_arr
end

p oddities_2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_2(['abc', 'def']) == ['abc']
p oddities_2([123]) == [123]
p oddities_2([]) == []

# def xor?(value1, value2)
# 	return true if (value1&&value2 == false) && (value1 == true || value2 == true)
# 	false
# end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false


#character count
p 'please write a word or multiple words'
string_array = gets.chomp.to_s
len = string_array.delete(' ').size
p "There are '#{len}' characters in your input."


number = 1
arr = []
loop do 
	p "Enter the #{number} number"
	value = gets.chomp.to_i
	arr << value
	number += 1
	break if number == 6
end

p "Enter the last number"
find_num = gets.chomp.to_i

if arr.include?(find_num)
	p 'The number is included'
else
	p "Nope not in there"
end