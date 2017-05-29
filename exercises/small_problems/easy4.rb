
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end


INT_DIG = ['0','1','2','3','4','5','6','7','8','9']

def integer_to_string(integer)
	string = ''
	i = 0
	loop do 
	  string<<INT_DIG[integer % 10]
	  integer /= 10
	  break if integer == 0
	end
	string.reverse
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'



DIG = {'0' =>0, '1' =>1, '2'=>2,'3'=>3,'4'=>4,'5'=>5,'6'=>6,'7'=>7,'8'=>8,'9'=>9}

def string_to_signed_integer(string)
	case string[0]
	when '-'
		string_to_integer(string.delete('-')) *-1;
	when '+'
		string_to_integer(string.delete('+'))
	else
		string_to_integer(string)
	end
end

def string_to_integer(string)
	len = string.size
	mult = 1
	value = 0
	string.chars.reverse.each do |x|
		value += (mult * DIG[x])
		mult *= 10
	end
	value
end

p string_to_integer('4321') == 4321
p string_to_signed_integer('-570') == -570

def running_total(array)
	sum = 0
	#map will return a new array based off the return value of the block
	array.map {|x| sum+=x}
end

def running_total_bhavik(array)
	new_array = []
	total = 0
	array.each do |x|
		new_array<<total+=x
	end
	new_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

def multisum(number)
	total = 0
	1.upto(number) do |x|
		total += x if (x % 3 == 0) || (x % 5 == 0)
	end
	total
end

#Leap Year Part 1
#leap year if evenly divisible by 4 but not 100
#if ! divisible by 100 then it should be by 400
def leap_year?(year)
	if year < 1752 && year % 4 == 0
		return true
	elsif (year % 4 == 0)
		if (year % 100 == 0)
			return false unless year % 400 == 0
		end
		return true
	end
	false
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

def century(date)
	first = (date / 100) + 1
	first -= 1 if date % 10 == 0
	case first % 100
	when 1
		ending = 'st'
	when 2
		ending = 'nd'
	when 3
		ending = 'rd'
	else
		ending = 'th'
	end
	first.to_s<<ending
end


def short_long_short(word1, word2)
	word1.size < word2.size ? word1+word2+word1 : word2+word1+word2
end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"