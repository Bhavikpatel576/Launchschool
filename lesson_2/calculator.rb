# Basic functionality 
# ask for two numbers
# asks for the type of operations (add, subtract, multiply, divide)
# display the result

def prompt(message)
	puts ("=>#{message}")
end

def int?(integer)
	Integer(integer) rescue false
end

def operation_to_message(op)
  word = case op
  when 'add'
  	'Adding'
  when 'subtract'
  	'Subtracting'
  when 'multiply'
  	'Mulplying'
  when 'divide'
  	'Dividing'
  end
  x = "A random line of code"

  word
end

prompt("Welcome to the calc app: Enter your name")

name = ''
loop do
	name = gets.chomp
	if name.empty?
		prompt('Please enter your name')
	else
		break
	end
end

num_1 = ''
loop do
	prompt('Enter the first number')
	num_1 = gets.chomp
	p int?(num_1).inspect
	if int?(num_1)
		break
	else
		prompt('thats not a number, try again')
	end
end

num_2 = ''
loop do
	prompt('Enter the second number')
	num_2 = gets.chomp
	if int?(num_2)
		break
	else
		prompt('thats not a number, try again')
	end
end

operator = ''
loop do
	prompt('Select: add, subtract, multiply, divide')
	operator = gets.chomp.to_s
	if %w(add subtract multiply divide).include?(operator)
		break
	else
		prompt('you chose the wrong operator, try again')
	end
end

result = case operator
						when "add"
								num_1.to_i + num_2.to_i
						when 'subtract'
								num_1.to_i - num_2.to_i
						when 'multiply'
								num_1.to_i * num_2.to_i
						when 'divide'
								num_1.to_f / num_2.to_f
						else
								p 'incorrect operator'
						end

p "output is #{result}"