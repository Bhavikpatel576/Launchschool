
def one_1?(array)
	count = 0
	array.each do |element|
		if yield(element)
			count +=1
			if count > 1
				return false
			end
		end
	end
	true
end

#we can use a switch system as well since it's only looking
#for one value

def one?(array)
	switch = false
	array.each do |element|
		 next unless yield(element)
		 return false if switch
		 switch == true
	end
	switch
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false