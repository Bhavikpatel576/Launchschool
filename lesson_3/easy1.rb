def prompt(message)
	puts ("=> #{message}")
end

puts 'question 1----------'
numbers = [1,2,2,3]
numbers.uniq

puts numbers

puts 'question 2----------'
prompt('whats the difference between ! and ?')
prompt('answer: the former is the bang operator and the latter inovkes a boolean opeartion')

prompt('what is != and where shoudl you use it?')
prompt('answer: does not equal, used for conditional statements')

prompt('puts ! before a variable like !user_name')

user_name = 'bhavpat'
if !user_name
	prompt('please enter a username')
else
	prompt('enter your password')
end

prompt("put ! after soemthing like words.unqi!")
prompt("this will mutate the caller and instead of returning, it will mutate")

user_name = 'bhavik'

p !user_name
p !!user_name

prompt("A single '!' will turn the object into the opposite of it's boolean value, and '!!' will turn it into it's boolean equivalent")

puts 'question 3 ------------'
advice = "Few things in life are as important as house training your pet dinasaur"
advice.gsub!('important', 'urgent')
p advice

puts 'quesiton 4-------------'
numbers = [1,2,3,4,5,6]
prompt('delete at will delete value at the given index')
numbers.delete_at(2)
p numbers
prompt('delete the number')
numbers.delete(6)
p numbers

puts 'question 5------------'
p (10..100).cover?(40)

puts 'question 6-----------'
famous_words = "seven years ago...."
p famous_words.prepend('Four score and ')
famous_words_2 = "seven years ago...."
p "four score and " << famous_words_2

def add_eight(number)
	number + 8
end

number = 2
how_deep = "number"
5.times {how_deep.gsub!("number", "add_eight(number)")}

p eval(how_deep)

puts 'question 8- -------------'
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones
p flintstones.flatten

