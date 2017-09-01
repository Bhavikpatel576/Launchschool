
#orginal method
# class Array
# 	def random_each
# 		shuffle.each do |el|
# 			yield el
# 		end
# 	end
# end

# [1,2,3,4,5].random_each do |el|
# 	puts el 
# end

#using a call to take in the proc via '&' syntax
# class Array
# 	def random_each(&b)
# 		shuffle.each do |el|
# 			b.call el
# 		end
# 	end
# end

# [1,2,3,4,5].random_each do |el|
# 	puts el 
# end


def multiple_generator(m)
	lambda do |n|
		n * m
	end
end


double = multiple_generator(2)
tripple = multiple_generator(3)

p double.class

















