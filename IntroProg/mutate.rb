

a = [1,2,3]

def mutate(array)
	array.pop
end

p "Before method is applied: #{a}"
mutate(a)
p "After method is applied: #{a}"
