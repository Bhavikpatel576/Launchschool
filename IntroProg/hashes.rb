#problem 1
# immediate_family = family.select {|family_member| family_member == :brothers || family_member == :sisters}

# #problem 2: Whats the difference between merge & merge!
# hash1 = {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown', :name=>'bob'}
# hash2 = {:sex=>"male", :race=>"Asian"}

# hash1.merge(hash2)
# hash1.merge!(hash2)

# #problem 3
# hash1.each_key do |key| <---key
# hash1.each_value do |values| <--value
# hash1.each do |x,y| <--display key and value

#problem 4
# person[:name]

#problem 5
array =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

results = {}

array.each do |words|
	key = words.split('').sort.join
	if (results.has_key?(key))
		results[key].push(words)
	else
		results[key] = [words]
	end
end

results.each do |x, y|
	puts '.................'
	p y
end


#problem 6



#problem 7



