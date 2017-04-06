# loan amount
# the Annual APR
# the loan duration

# calculate: monthly interest rate, loan duration

def prompt(message)
	puts("=> #{message}")
end

def valid_int(number)
	Integer(number) rescue false
end

def valid_float(number)
	Float(number) rescue false
end

def valid_num(number)
	valid_float(number) || valid_int(number)
end

prompt("Welcome to mortgage payment calculator! Let's get started")

#get loan amount
prin = ''
loop do 
	prompt("Enter the loan amount")
	prin = gets.chomp
	break if valid_num(prin)
	prompt("Doesn't look like that is a correct input")
end

#get the annual apr
r = ''
loop do 
	prompt("Enter your interest rate in APR. Example .05 for 5%")
	r = gets.chomp.to_f
	break if valid_num(r)
	prompt("Doesn't look like that is a correct input")
end

#get the duration of the loan
n = ''
loop do 
	prompt("How long is your loan in months")
	n = gets.chomp.to_i
	break if valid_num(n)
	prompt("Doesn't look like that is a correct input")
end

#convert APR to monthly interest rate
m = ""
def monthly_pmt(prin, r, n)
	j = r.to_f / 12
	m = prin.to_f * (j/(1 - (1 + j)**(-n)))
end

result = monthly_pmt(prin,r,n)
#print result
p "your monthly payment is $#{format('%02.2f', result)}"