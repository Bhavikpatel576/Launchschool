require 'pry'
def any1?(array)
	count = 0
	while (array.size > count)
		return true if yield(array[count])
		count += 1
	end
	return false
end

#refactored
def any?(array)
	array.each { |value| return true if yield(value) }
	false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false