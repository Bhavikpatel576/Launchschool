def some_method
  a = "test this methods scope"
  puts "True"
end

def other_method
	puts some_method
end

p other_method
