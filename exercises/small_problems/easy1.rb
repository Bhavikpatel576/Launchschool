
#odd
def is_odd?(value)
  if (value.abs % 2 == 0)
    return false
  else
    return true
  end
end

value = Array.new(20) {rand(0..100)}

a = 30
p a.odd?

value.each do |x|
  #p "Created method output #{is_odd?(x)} vs. the std library #{x.odd?}"
end


#List of numbers
#takes a positive numbers like 12345 and creates a list 

def return_list(value)
  array = value.to_s.split('')
  array.map! {|x| x.to_i}
  #value.to_s.chars.map(&:to_i)
end
 
p return_list(12345)

# solution 2
def create_list(value)
  array = []
  while (value > 0)
    add_num = value % 10
    array << add_num
    value /= 10
  end
  array.reverse # costly line
end

p create_list(12345)

#Launch school solution


def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

p create_list(12345)


#How many?
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  hashtbl = {}
  array.each_with_index  do |name, index|
    if hashtbl[name]
      hashtbl[name] += 1
    else
      hashtbl[name] = 1
    end
  end
  hashtbl
end

p count_occurrences(vehicles)

#Reverse it

def reverse_sentence(sentance)
  rev_sentance = sentance.split(" ").reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

def reverse_words(sentance)
  words = sentance.split(' ')
  words.map! do |x| 
  if x.chars.count > 4
    x.chars.reverse.join('')
  else
    x
  end
end
  words.flatten.join( ' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


p '----------STRINGY--------------'
def stringy(value)
  string = ''
  value.times  do |x|
    if x.odd?
      string << '0'
    else
      string << '1'
    end
  end
  string
end


def optimizated_stringy(value)
  string = ''
  value.times do |x|
    num = x.odd? ? 0 : 1
    string << num
  end
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

p '-average-------------'

def average(array)
  sum = array.inject(0) {|sum, x| sum + x} / array.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

p '-sum-------------'

def sum(value)
  nums = value.to_s.split('')
  sum = nums.reduce {|sum, x| sum.to_i + x.to_i}
  sum
end

def sum2(value)
  value.to_s.split('').map(&:to_i).reduce(:+)
  # the &:to_i is like a function pointer. You're using the address of 
  # method to_i and runnining each 
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts sum2(23) == 5
puts sum2(496) == 19
puts sum2(123_456_789) == 45


#Whats my bonus
p '---where is my bonus at?-----'
def calculate_bonus(salary, boolean)
  #bonus = (boolean == true) ? salary / 2 : 0 <--- my answer
  boolean ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000










