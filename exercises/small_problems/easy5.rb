MINUTES_PER_HOUR = 60
HOUR_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOUR_PER_DAY
NUMTOCHAR = %w(zero one two three four five six seven eight nine ten twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

#ASCII STRING
def ascii_value(string)
	sum = 0 
	string.chars.each {|x| sum += x.ord}
	sum
end

#After midnight
def time_of_day(number)
	delta_minutes = number % MINUTES_PER_DAY
	hour, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
	format('%02d:%02d', hours, minutes)
end

#After Midnight (part2)
def after_midnight(number)
	hours = number[0..1]
	minutes = number[3..4]
	total = hours.to_i * MINUTES_PER_HOUR + minutes.to_i
	total % MINUTES_PER_DAY
end

def before_midnight(number)
	d = MINUTES_PER_DAY - after_midnight(number)
	d = 0 if d == MINUTES_PER_DAY
	d
end

#Letter Swap
def swap_letters(string)
	string.split.map do |value|
		value.reverse
	end
end

def swap_letters_correct(string)
	string.split.map do |value|
		temp = value[0]
		value[0] = value[-1]
		value[-1] = temp
		value
	end
end

# Clean up the words
# replace all non-alphabetic chars with spaces.
# Consecutive non-chars = 1 space

def cleanup(string)
	s = string.gsub(/[^0-9a-z]/i, ' ')
	s.squeeze(" ")
end

#Letter Counter (part 1)
def word_sizes(string)
	word_count = {}
	string.split.each do |word|
		word_s = word.size
		if word_count[word_s]
			word_count[word_s] += 1
		else
			word_count[word_s] = 1
		end
	end
	word_count
end

def word_sizes_correct(string)
	count = Hash.new(0)
	string.split.each do |word|
		count[word.size] += 1
	end
	count
end

#Letter Counter (part 2)
def word_size_char(string)
	count = Hash.new(0)
	count.merge!(word_sizes_correct(cleanup(string)))
	count
end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

#Alphabetical Numbers


def alphabetic_number_sort(array)
	array.sort_by { |num| NUMTOCHAR[num] }
end

#ddaily double
def crunch(string)
	array = string.chars
	test = array.select.with_index do |value, index|
		array[index] unless array[index] == array[index + 1]
	end
	test.join("")
end

#Bannerizer **try word wrapping very long messages so they appear on multiple lines
def print_in_box(string)
	num = '-' * string.size
	space = ' ' * string.size
	p "+-#{num}-+"
	p "| #{space} |"
	p "| #{string} |"
	p "| #{space} |"
	p "+-#{num}-+"
end


print_in_box('')