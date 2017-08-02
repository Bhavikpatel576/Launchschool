

def bubble_sort!(array)
	loop do 
		swap = false
		1.upto(array.size - 1) do |idx|
			if block_given?
				next if yield(array[idx - 1], array[idx])
				array[idx - 1], array[idx] =  array[idx], array[idx - 1]
				swap = true
			else
				next if array[idx - 1] <= array[idx]
				array[idx - 1], array[idx] =  array[idx], array[idx - 1]
				swap = true
			end
		end
		break unless swap
	end
end

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

def bubble_sort_refact!(array)
	loop do 
		swap = false
		1.upto(array.size - 1) do |idx|
			if block_given?
				next if yield(array[idx - 1], array[idx])
			else
				next if array[idx - 1] <= array[idx]
			end
			array[idx - 1], array[idx] =  array[idx], array[idx - 1]
			swap = true
		end
		break unless swap
	end
end