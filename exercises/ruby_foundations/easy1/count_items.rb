def count(array)
	count = 0
	array.each do |element|
		if yield(element)
			count +=1
		end
	end
	count
end

p count([1,2,3,4,5]) { |value| value.odd? }
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false }
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2