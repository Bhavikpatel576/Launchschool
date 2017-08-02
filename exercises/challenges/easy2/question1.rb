
#Whats the matter with Kansas?

def output_string(string)
	result = string.split().map.with_index do |value, idx|
		if idx.odd?
			value.reverse 
		else
			value
		end
	end
	result.join(" ")
end


def output_bonus(string)
	length = string.length
	count = 0
	word_index = 0
	while(count < length)
		while(string[count] == ' ')