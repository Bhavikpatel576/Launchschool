# Basic functionality 
# ask for two numbers
# asks for the type of operations (add, subtract, multiply, divide)
# display the result

def prompt(message)
	puts ("=>#{message}")
end

prompt('Enter the first number')
num_1 = gets.chomp.to_i
prompt('Enter the second number')
num_2 = gets.chomp.to_i
prompt('Select operator: add, subtract, divide, multiply')
operator = gets.chomp.to_s
result = 	case operator
						when 'add'
								num_1 + num_2
						when 'subtract'
								num_1 - num_2
						when 'multiply'
								num_1 * num_2
						when 'divide'
								num_1.to_f / num_2.to_f
						else
								p 'incorrect operator'
						end

p 'output is #{result}'