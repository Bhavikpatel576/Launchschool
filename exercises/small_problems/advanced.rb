# test = File.open("./text2.txt", "r")
# content = test.read

# array1 = content.split("\n")

# verb_array = []
# noun_array = []
# adj_array = []
# adv_array = []

# array1.map do |x|
# 	p_of_speech = x.split("\t")
# 	verb_array << p_of_speech[1] 
# 	noun_array << p_of_speech[2] 
# 	adj_array << p_of_speech[3] 
# 	adv_array << p_of_speech[4]
# end

# def mad_lib(verb, noun, adj, adv)
# 	s1 = "#{verb} #{noun} #{adj} #{adv}"
# 	s2 = "#{verb} #{noun} #{adj} #{adv}"
# 	s3 = "#{verb} #{noun} #{adj} #{adv}"
# 	s4 = "#{verb} #{noun} #{adj} #{adv}"
# 	p [s1, s2, s3, s4].sample
# end

# mad_lib(verb_array.sample, noun_array.sample, adj_array.sample, adv_array.sample)

# ADJECTIVES = %w(quick lazy sleepy ugly).freeze
# NOUNS      = %w(fox dog head leg cat tail).freeze
# VERBS      = %w(spins bites licks hurdles).freeze
# ADVERBS    = %w(easily lazily noisly excitedly).freeze

# File.open('madlibs.txt') do |file|
#   file.each do |line|
#     puts format(line, noun:      NOUNS.sample,
#                       verb:      VERBS.sample,
#                       adjective: ADJECTIVES.sample,
#                       adverb:    ADVERBS.sample)
#     sleep(10)
#   end
# end


#the figure is semeterical, print the first half, then the second half
#spacing of line is determined by line number
def print_line(number, line)
	space = " " * line
	test = "*#{space}*#{space}*"
	puts test.center(number)
end

def print_start(number)
	first_half = number / 2  - 1
	first_half.downto(0) { |num| print_line(number, num) }
	puts "*" * number
	0.upto(first_half) { |num| print_line(number,num)}
end

def transpose(matrix)
	n = matrix.length
	new_matrix = Array.new(n) {Array.new(n)}
	0.upto(n - 1) do |x|
		0.upto(n - 1) do |y|
			new_matrix[x][y] = matrix[y][x]
		end
	end
	new_matrix
end

def transpose_answer(matrix)
	new_matrix = []
	n = matrix.length
	0.upto(n - 1) do |x|
		new_row = 0.upto(n - 1).map {|y| matrix[y][x]}
		new_matrix << new_row
	end
	new_matrix
end


def transpose2(matrix)
	n = matrix.length
	m = matrix[0].length
	new_matrix = Array.new(m) {Array.new(n)}
	0.upto(n - 1) do |x|
		0.upto(m - 1) do |y|
			new_matrix [y][x] = matrix[x][y]
		end
	end
	new_matrix
end


def rotate90(matrix)
	n = matrix.length
	m = matrix[0].length
	new_matrix = []
	(0).upto(m-1) do |x|
		new_row = (n-1).downto(0).map {|y| matrix[y][x]}
		new_matrix << new_row
	end
	new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

def my_method(array)
  if array.empty?
    []
  elsif array.count > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

#this answer is incorrect because it mutates the original arrays
def merge_bhav(array1, array2)
	new_array = []
	len1 = 0
	len2 = 0
	while (!array1.empty? && !array2.empty?) # what if the second array is larger?
		if array1[len1] > array2[len2]
			new_array << array2.shift
		else
			new_array << array1.shift
		end
	end
	while (!array1.empty? || !array2.empty?)
		if !array1.empty?
			new_array << array1.shift
		elsif !array2.empty?
			new_array << array2.shift
		end
	end
	p new_array
end

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end


# divide
# conquore 
# combine
def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]

def unegyptian(array)
	num = 1
	dem = 1
	

	Rational(num/dem)
end


































