#exercise 1
Array = [1,2,3,4,5,6,7,8,9,10]
Array.each {|x| puts x}
p "-----ex2-------"
#exercise 2
Array.each{|x| p x unless x < 5}
p "-----ex3-------"
#exercise 3
new_array = Array.select {|x| x%2 == 0}
p new_array
p "-----ex4-------"
#exercise 4
Array.push(11)
Array.insert(0,0)
#alternative solution
#Array.unshift(0)
p Array
p "-----ex5-------"
#exercise 5
Array.delete(11)
Array << 3
p Array
p "-----ex6-------"
#exercise 6
p Array.uniq!
p "-----ex7-------"
#exercise 7
p 'the major difference between an array and a hash is the 
keys that are associated with each hash.'
p "-----ex8-------"
#exercise 8
hash1 = {:hash1 => 1, :hash2 => 2}
Ahash = {hash1:1, hash2:2, hash3:3, hash4:4}
p "-----ex9-------"
#exercise 9
h = {a:1, b:2, c:3, d:4}
value = h[:b]
p value
h.merge!(e:5)
h.delete_if {|key, value| value < 3.5}
p h
p "-----ex10-------"
#exercise 10

h[:d] = [1,2,3,4,5,6,7]
p h
a = []
a << h
a << h
p a

p "-----ex11-------"
#exercise 11

p "-----ex12-------"
#exercise 12
keys = [:email, :address, :phone]
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}} 
contacts.each_with_index do |(key,value), index|
	contacts[key] = keys
	0.upto(2) do |x|
	contacts[key][x] = contact_data[0][x]
	end 
end
p contacts
p "-----ex13-------"
#exercise 13
p contacts["Joe Smith"]

p "-----ex14-------"
#exercise 14
p "-----ex15-------"
#exercise 15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if {|word| word.start_with?('s')}
p arr
p "-----ex16-------"
#exercise 16
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! {|x| x.split}
p a.flatten

p "-----ex17-------"
#exercise 17
p 'the same shit!'



