
# Exercise 1
[1, 2, 3].select do |num|
  num > 1
  'hi'
end

# the return value will always be 'hi' which is a truthy value, so the original array will be returned. 

#Exercise 2


#Exercise 3
ages1 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages2 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the people thtt are > 100

ages1.delete_if {|key, value| value > 100 }
p ages1

#or
ages2.keep_if {|key, value| value < 100}
p ages2

#Exercise 4
#pick out minimum age
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_list = ages.values
p ages_list.sort.first

# or 'Launch School'
p ages.values.min

#Exercise 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#return the index with the element that starts with 'Be'
p flintstones.index {|name| name[0..1] == 'Be'}
#the method index followed by a block returns the first value where the return statement
# is true 

#Exercise 6
#ammend array so elements only include first three letters
flintstones.map! do |name|
	name = name[0,3]
end

# or 
flintstones.map! do |name|
	name[0,3]
end

p flintstones

#Exercise 7
statement = "The Flintstones Rock"
#create a hash map with the frequency of letters for the string
letter_count = {}
letter_split = statement.split("")
letter_split.each_with_index do |key, value|
	if letter_count[key]
		letter_count[key] += 1
	else
		letter_count[key] = 1
	end
end

#or 
# creates an array of A-Z + a-z letters and creates a frequency hash map 
# based off statement
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

p numbers	

#
words = 'the flintstones rock'
p words.split.map {|words| words.capitalize}.join(' ')


#Example 10 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#add a new hash key called age_group and assign kid, adult, or senior
names = munsters.keys
names.map do |name|
age = munsters[name]["age"]
	case age
	when (0..18)
		munsters[name]["age_group"] = 'kid'
	when (19..50)
		munsters[name]["age_group"] = 'adult'
	when 
		munsters[name]['age_group'] = 'senior'
	end
	munsters
end
p munsters
































