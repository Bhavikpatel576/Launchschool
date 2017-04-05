
#problem 1 

array = ['laboratory', 'experiment', 'pans labyrinth', 'elaborate', 'polar bear']

array.each do |words|
	unless words =~ /lab/
		p words
	end
end

#correct version of problem 2
def execute(&block)
	block.call
end

execute {
 puts "hello from inside the execute method!"
}

#number 5
#use the & sign on block. 

