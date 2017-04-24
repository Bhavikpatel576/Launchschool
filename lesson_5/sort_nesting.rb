order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

customer_orders = order_data.map do |row|
  {
    customer_id: row[:customer_id],
    customer_name: row[:customer_name],
    orders: [
      {
        order_fulfilled: row[:order_fulfilled],
        order_value: row[:order_value]
      }
    ]
  }
end


all_orders = []

customer_orders.each do |customer_data|
  cust_arr = [
    [:customer_id, customer_data[:customer_id]],
    [:customer_name, customer_data[:customer_name]],
    [:total_order_value]
  ]

  order_value = 0
  customer_data[:orders].each do |order|
    order_value += order[:order_value]
  end

  cust_arr[2] << order_value

  all_orders << cust_arr
end

p all_orders

p '--------------quiz -----------------'





# #sort ascending 
# arr = ['10', '11', '9', '7', '8']

# arr.sort! do |a,b|
#   a.to_i<=>b.to_i
# end

# p arr

# #sort decending
# arr = ['10', '11', '9', '7', '8']
# arr.sort! do |a,b|
#   b.to_i<=>a.to_i
# end

# p arr

# #sort by published year 

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort! do |a,b|
#   a[:published]<=>b[:published]
# end

# # Alternative
# # books.sort_by do |books|
# #   books[:published]

# p books

# p '----------test your reference--------'
# #test your reference
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]
# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]
# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]
# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].key(0)


# #add values of hash based off condition
# #conditional hash
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# total = 0
# value = munsters.each_value do |value|
#   total += value["age"].to_i if value["gender"] == "male"
# end

# p total

# munsters.each_with_index do |value, i|
#   p "#{value[0]} is #{value[1]["age"]} years old and is a #{value[1]["gender"]}"
# end

# #exercise 7
# a = 2
# b = [5, 8]
# arr = [a, b]
# #arr => [2,[5,8]]
# arr[0] += 2
# #arr => [4,[5,8]]
# arr[1][0] -= a
# #what is a? Do we subtract 2 or 4 from 5?
# p a.object_id
# p arr[0].object_id
# # a does not change so the result would be [4,[3,8]]
# # arr[0] does not point to a anymore. It has it's own object id. 



# #exercise 8 
# #print out all the vowels in the string 

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# vowels = %w(a e i o u y)

# hsh.each_value do |value|
#   value.each do |word|
#     word.chars.each do |c|
#       p c if vowels.include?(c)
#     end
#   end
# end


# #exercise 9 
# #return the same array, but sorted with each data type respectively
# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
# new_arr = arr.map do |sub_arry|
#   sub_arry.sort do |a,b|
#     a<=>b
#   end
# end

# p new_arr

# #exercise 10 
# #increment each integer by 1

# hsh_1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# hsh_2 = hsh_1.map do |value|
#   increment_hash = {}
#   value.each do |key, value|
#      increment_hash[key] = value + 1
#    end
#    increment_hash
# end

# p hsh_2

# #Ex 11
# #mutate the array to contain only multiple of 3s
# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# p '-----------ex11-----------'

# arr.map do |array|
#   array.select do |values|
#     values%3 == 0
#   end
# end

# p arr

# #Ex 12
# # return a hash where first elem is the key and the second in the array is the value
# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# hasher = {}
# arr.each do |x|
#    hasher[x[0]] = x[1]
# end

# p hasher

# #EX13
# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# z = arr.sort_by do |sub_arr|
#   sub_arr.select do |num|
#     num.odd?
#   end
# end
# p z

# p '-----------------ex 14-----------'
# #EX14 -Review this problem
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# # Returns color of fruits, and sizes of vegetables.
# #[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# #p hsh.each {|x| p x}
# #p hsh['grape'][:type] == 'fruit'

# t = hsh.map do |_, value|
#   if value[:type] == 'fruit'
#     value[:colors].map do |x|
#       x.capitalize
#     end
#   else
#     value[:size].upcase
#   end
# end

# p t

# p '--------------ex 15--------------'

# #return an array where the hashes only contain even ints
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# even_arr = arr.select do |hasher|
#   hasher.all? do |a, b|
#     p a 
#     p b 
#     p b.all? {|x| x.even?}
#     b.all? {|x| x.even?}
#   end
# end

# p even_arr  

# p '---------------ex 16------------'

# #return a UUID. Each value can contain up to 32 hexadecimals 
# # 8-4-4-4-12 is the arrangement 

# def UUID
#   value_list = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
#   array1 = value_list.sample(8)
#   array2 = value_list.sample(4)
#   array3 = value_list.sample(4)
#   array4 = value_list.sample(4)
#   array5 = value_list.sample(12)
#   [array1,'-',array2,'-',array3,'-',array4,'-',array5].flatten.join('')
# end

# x = UUID()

# p x








