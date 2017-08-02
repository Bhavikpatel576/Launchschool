#Problem:
#write a method that takes a sorted array and returns an array of the missing values
#between numbers, if any.

#brute force
def missing_brute(array)
	count = 0
	new_array = []
	while(array.size - 1 > count)
		if (array[count] + 1) != array[count + 1]
			value = array[count]
			while(value < array[count + 1] - 1)
				new_array << value + 1
				value += 1
			end
		end
		count += 1
	end
	new_array
end

p missing_brute([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_brute([1, 2, 3, 4]) == []
p missing_brute([1, 5]) == [2, 3, 4]
p missing_brute([6]) == []


#we need to return the missing consecutive values.
#we are given the current sorted array. If we had every
#single element, we could take the difference

def missing(array)
	new_array = (array[0]..array[-1]).to_a
	new_array - array
end

def missing_2(array)
	result = []
	array.each_cons(2) do |first, second|
		result.concat(((first + 1)..(second - 1)).to_a)
	end
	result
end
p missing_2([-3, -2, 1, 5])
