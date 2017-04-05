x = [1,2,3,4,5,6]

x.each do |x|
	x += 1
end

#  Number 3 
x.each_with_index do |x,y|
	puts "value '#{x}' at index '#{y}'"
end
