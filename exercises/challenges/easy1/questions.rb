class DNA
	attr_accessor :string
	def initialize(string)
		@string = string
	end

	def man_string
		jason = "jason"
		string = jason
	end

	def hamming_distance(string2)
		string1_length = string.length
		string2_length = string2.length
		if string1_length > string2_length
			#this doesn't work for some reason. Why?
			#string = string.slice(0...string2_length)
			@string = string.slice(0...string2_length)
		elsif string2_length > string1_length
			#slice2
			string2 = string2.slice(0...string1_length)
		end
		p string
		p string2
		count = 0
		string.chars.zip(string2.chars).each do |s1, s2|
			count += s1.count(s2)
		end
		count
	end
end

test = DNA.new('pooper')
test.hamming_distance('oppo')