# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

#line 2 assigns a proc to the variable my_proc. The proc
#is an object where its local varaibles have been bounded.
#this allows the code to be called in a different context and 
#still use those variables. 
#line 3 outputs the object
#line 4 outputs the class of the objecg
#line 5 call invokes the block 
#line 6 calls the block and passes in the parameter cat into the block as
#its local variable. 

# Group 2
# puts ""
# puts "Group 2"
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" } #not sure what the '->' is
# puts my_lambda
# puts my_second_lambda(23)
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

#line 21&22 print out the lambda object. line 25 outputs the class
#line22 is doing something weird 
#line 28 you're not able to create a instance with Lambda.new (giving me an error)


# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# #line 40 yeild the block with nothing assigned to seal 
# block_method_1('seal')
# #line 42 produces an error because a block is not provided 

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}