#shift first element to the back of the array [0] - > ['end']
def rotate_array(array)
	array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, shift)
	array = number.to_s.chars
	len = array.size - 1
	array_1 = rotate_array(array[-shift..-1])
	array_2 = array[0..-shift - 1] + array_1
	array_2.join().to_i
end

def max_rotation(number)
	len = number.to_s.size
	len.downto(2) do |x|
		number = rotate_rightmost_digits(number,x)
	end
	number
end
