def prompt(message)
	p ("=> #{message}")
end

prompt('question 1')
string = 'The Flintstones Rock!'
10.times {|_| p string.prepend(' ')}
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

prompt('question 2')
#puts "the value of 40 + 2 is " + (40 + 2)
#doesn't work because we are trying to concat a integer to a string
# use string interpulation
puts "the value of 40 + 2 is " + "#{(40 + 2)}"
# or a use a method to convert to string
puts "the value of 40 + 2 is " + (40 + 2).to_s

prompt('--------question 3----------')
def factors(number)
  dividend = number
  divisors = []
  while (number > 0) do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# the condition if Number % dividend == 0 is see if there isn't a remainder

prompt('-------question 4---------')
p 'using the operator << actually mutates the caller where + does not, rather creates
	a new object'

prompt('-------question 5---------')
limit = 15 # or you can include limit within the function, however you'll 
# not be able to pass a number greater than 14. 
def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

prompt('-------question 6---------')

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

def mutate_array(an_array_param)
  an_array_param << "rutabaga"
end

def return_concat_string(a_string_param)
  a_string_param += "rutabaga"
end

p return_concat_string(my_string)


prompt('-------question 7----------')
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

#answer is 34. (42 -8)

prompt('-------question 8----------')

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
p munsters

=begin
First when 'munsters' gets passed into the method, the object id is used and not the values
the method internally stores these object id's in it's scope. Since demo hash isn't reassigned
the information gets overwritten to the same object id.
=end

prompt('-------question 9----------')
#(paper, rock) => paper, (rock, scissors) => rock, paper vs rock => paper

prompt('-------question 10---------')
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p foo #yes
p bar("yes") # no
p bar(foo)
#answer =no

prompt('-------question 11---------')



















