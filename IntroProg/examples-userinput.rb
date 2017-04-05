# launch school answer
# def read_number
#   loop do
#     puts '>> Please enter a positive or negative integer:'
#     number = gets.chomp
#     return number.to_i if valid_number?(number)
#     puts '>> Invalid input. Only non-zero integers are allowed.'
#   end
# end

# first_number = nil
# second_number = nil

# loop do
#   first_number = read_number
#   second_number = read_number
#   break if first_number * second_number < 0
#   puts '>> Sorry. One integer must be positive, one must be negative.'
#   puts '>> Please start over.'
# end

# sum = first_number + second_number
# puts "#{first_number} + #{second_number} = #{sum}"
#------------------------------------------------------------------------------------
# #my answer
# def valid_number?(number_string)
# 	number_string.to_i.to_s == number_string && number_string.to_i != 0
# end

# number1 = nil
# number2 = nil
# loop do 
# 	p '>> Please enter a positive or negative number'
# 	number1 = gets.chomp
# 	p '>> Please enter a positive or negative number'
# 	number2 = gets.chomp

# 	if (number1.to_i > 0 && number2.to_i > 0) || (number1.to_i < 0 && number2.to_i < 0) 
# 		p '>> Sorry. One integer must be positive, one must be negative'
# 		p '>> Please Start Over'
# 	elsif (number1.to_i == 0 || number2.to_i == 0)
# 		p 'Number cannot be zero'
# 	else 
# 		break if (valid_number?(number1) && valid_number?(number2))
# 	end
# end
# result = nil
# result = number1.to_i + number2.to_i
# p "#{number1} + #{number2} = #{result}"


#my answer
loop do 
	number_of_lines = nil
	input  = nil
	loop do 
		puts '>>  How many output lines do you want? Enter a number >= 3'
		input = gets.chomp.downcase
		number_of_lines = input.to_i

		break if input == 'q'
		break if number_of_lines >= 3
		puts ">>That's not enough"
	end

	break if input == 'q'
	while number_of_lines > 0 
		puts 'launch school is ok'
		number_of_lines -= 1
	end
end

# loop do
#   input_string = nil
#   number_of_lines = nil

#   loop do
#     puts '>> How many output lines do you want? ' \
#          'Enter a number >= 3 (Q to Quit):'

#     input_string = gets.chomp.downcase
#     break if input_string == 'q'

#     number_of_lines = input_string.to_i
#     break if number_of_lines >= 3

#     puts ">> That's not enough lines."
#   end

#   break if input_string == 'q'

#   while number_of_lines > 0
#     puts 'Launch School is the best!'
#     number_of_lines -= 1
#   end
# end



# def valid_number?(number_string)
# 	number_string.to_i.to_s == number_string
# end

number1 = nil
loop do 
	p 'enter the numerator'
	number1 = gets.chomp
	break if (valid_number?(number1))
	p "Number is invalid"
end

number2 = nil
loop do 
	p 'enter the denominator'
	number2 = gets.chomp
	break if (valid_number?(number2))
	p "Number is invalid"
end

result  = number1.to_i / number2.to_i
p "#{number1} / #{number2} is #{result}"

SAVED_PASSWORD = "hello!"
SAVED_USERNAME = 'bpatel576'

loop do
	p 'enter username'
	username = gets.chomp.to_s
	p 'enter password'
	password = gets.chomp.to_s
	if (password != SAVED_PASSWORD || username != SAVED_USERNAME)
		p '>>Authorization failed'
	else
		p 'congrats, you cracked the code'
		break
	end
end


p 'what is your age in years?'
number = gets.chomp.to_i
months = number * 12
puts "You are #{months} months old"

loop do 
p "Do you want me to print something? (y/n)"
choice = gets.chomp.to_s.downcase
 if choice == 'y'
 	puts 'Y'
 	break
 elsif choice == 'n'
 	puts 'N'
 	break
 else
 	puts 'Please select a different input'
 end
end

# //alternative to the code above
# choice = nil 
# loop do 
# 	puts '>> Do you want me to print something (y/n)'
# 	choice = gets.chomp.downcase
# 	break if %W(y n).include?(choice)
# 	puts '>> Invalid input! Please enter y or n'
# end
# puts 'something' if choice == 'y'

p '>>How many output lines do you want? Enter a number >= 3:'
number = gets.chomp.to_i
if number < 3
	p "that's not enough lines"
else
	number.times do
		p 'launch school is cool'
	end
end

