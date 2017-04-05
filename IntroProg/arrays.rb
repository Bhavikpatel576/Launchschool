arr = [1,2,3,4,5,6]
number_check = 3

arr.each do |x|
	if x == number_check
		puts 'value contained in array'
	end
end

p 'Problem number 3'
arr2 = [['test', 'orange'], ['girl','boy','example', 'mom']]
puts arr2.last[2]