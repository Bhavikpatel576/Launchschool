
# class Sieve 
# 	def initialize(number)
# 		@number = number
# 	end
# end

# 1. create a range of numbers from 0 to the number listed 
# 2. create a hash map out of the range of number
# 3. set all values of the keys initially to zero
# 4. iterate through the series 
# 5. iteration will step through by multiple of value and set to 1
# 6. move to the next value not set to 1


def sieve(number)
	hash = Hash.new
	#create a range of numbers
	(0).upto(number) do |idx|
		hash[idx] = 0
	end
	#iterate through the series
	hash.each_with_index do |keys, value|
		if hash[0] == 0 || hash[0] == 1
			next
		end
		multiple_max = number / [0]
		(1).upto(multiple_max) do |multiple|
			keys[0 * multiple] = 1
		end
	end
	hash
end

p sieve(100)