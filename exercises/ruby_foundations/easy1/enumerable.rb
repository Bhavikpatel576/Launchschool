#A binary tree is just one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more. All of these collection classes include the Enumerable module, which means they have access to an each method, as well as many other iterative methods such as map, reduce, select, and more.

class Tree
	include Enumerable

	def each
		# ... define each that yields each member of the collection
	end
end