#method yeild the block and returns Does not compute if an error 
#is returned, for example, if a block is not given. Using yield will 
#will expect to read in a block as a parameter
def compute
	yield rescue "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

#this method adds an argument that is passed into the block
def compute(num)
	yield(num) rescue "Does not compute."
end

p compute(2) { |n| n + 1 }
p compute('A') { |n| n + 'b' }

#using a ternary operator and the method block_given
def compute 
	block_given? ? yield : "Does not compute"
end
