#use internal and external iterators on the first 7 numbers of
#a factorial

def factorial(number)
	total = 1
	return 1 if number == 0
	while(number > 0)
		total *= number
		number -= 1
	end
	total
end

fact = Enumerator.new do |y|
	a = 1
	total = 1
	loop do 
		y << total
		total *= a
		a += 1
	end
end

#external way to iterate through fact
#7.times {p fact.next}

fact.rewind

fact.each_with_index do |value, idx|
	puts value
	break if idx == 6
end