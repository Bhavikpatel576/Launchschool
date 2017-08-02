#part 1 : modify the method so that the display/output is moved to a block, and 
#it's implementation is left up to the user of the gather method

item = ['apple', 'corn', 'cabbage', 'wheat']

def gather_2(item)
	puts "Let's start gathering food"
	puts "#{item.join(',')}"
	puts "Let's start gathering food"
end


def gather(item)
	puts "Let's start gather food"
	yield(item) if block_given?
end

gather(item) { |v| puts "We need the following food: #{v.join(' ,')}"}
#gather_2(item)

#part 2: Using the splat operator for collections
#when we use yield to pass in the array into the block, we can specify
#within the block how elements we want to work with. 
# |_,_,*remaining_elements| =>signifying to ignore the first two
def gather_3(item)
	yield(item)
end

birds = ['crow', 'finch', 'hawk', 'eagle', 'osprey']
gather(birds) do |element1, element2, remaining_elements|
	puts "Remaining birds:#{remaining_elements}"
end

items = ['apples', 'corn', 'cabbage', 'wheat']

puts "----Part 3 questions 1-4--------"
def gather_4(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

puts ""
puts "question1"
gather_4(items) do |*a,b|
  puts a.join(", ")
  puts b
end

puts ""
puts "question2"
gather_4(items) do | a, *b, c|
  puts a
  puts b.join(", ")
  puts c
end

puts ""
puts "question3"
gather_4(items) do |a,*b|
  puts a
  puts b.join(", ")
end

puts ""
puts "question4"
gather_4(items) do | a, b, c,d |
  puts "#{a}, #{b}, #{c}, and #{d}"
end















	