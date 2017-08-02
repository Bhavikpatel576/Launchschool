#create a method that returns all the postive divisors of
#the number passed in as an argument


#Create an array to contain the list of pos div
#Start from the number one
#Test to see if pos div, include in array if so 
#increment

def divisors(number)
	new_array = []
	1.upto(number) do |num|
		new_array << num if number % num == 0
	end
	new_array
end

# divisors(1) == [1]
# divisors(7) == [1, 7]
# divisors(12) == [1, 2, 3, 4, 6, 12]
# divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


#########################################################################
#################how can we make this go really fast#####################
#########################################################################

#one way is to only use the first half the numbers, and then use them on the second half





p '------------------someone else\'s solution----------'
def divisors_select(number)
	1.upto(number).select do |num|
		number % num == 0
	end
end

p divisors_select(1) == [1]
p divisors_select(7) == [1, 7]
p divisors_select(12) == [1, 2, 3, 4, 6, 12]
p divisors_select(98) == [1, 2, 7, 14, 49, 98]

require 'prime'

def divisors(int)
  # Get all prime factors and their exponent of int
  # 12 = 2^2 * 3^1
  # prime_division will return [[2, 2], [3, 1]]  ==  2^2 * 3^1
  # then transpose that array to segregate the primes and exponents
  # == [[2, 3], [2, 1]]  ( [[prime numbers], [exponents of primes]] )
  # then multiple assign to primes, powers
  # prime == [2, 3]
  # power == [2, 1]
  primes, powers = int.prime_division.transpose

  # If there are no prime numbers factors, return an array of [1, int] uniques
  return [1, int].uniq if primes.nil?

  # else:
  # Create an array of exponent ranges for each prime
  # for the prime 2, we have an exponent of 2, so the first array would look like [0, 1, 2]
  # for the prime 3, the exponent is 1 => [0, 1]
  # #map returns => [[0, 1, 2], [0, 1]]
  exponents = powers.map{|i| (0..i).to_a}

  # Here, we assign the divisors variable to an array of all of the divisors of int by:
  # 1: Removing the first array of exponents, returning it, and calling #product on the remaining arrays
  # => [0, 1, 2].product([0, 1])
  # returns [[0, 0], [0, 1], [1, 0], [1, 1], [2, 0], [2, 1]]
  #
  # 2. each set of exponents are passed into #map as powers
  divisors = exponents.shift.product(*exponents).map do |powers|

    # 3. We take the prime numbers and zip the block parameter powers into it
    # First iteration:  [2, 3].zip([0, 0]) => [[2, 0], [3, 0]]
    # Second iteration: [2, 3].zip([0, 1])
    # and so on...
    #
    # For each iteration, the zipped array is passed into #map again, where we pass in each 
    # sub-array element and assign prime and power block variables
    # 
    # First iteration : prime = 2, power = 0
    # Second iteration: prime = 3, power = 0
    #
    # The block evaluates the prime block parameter to the power of the block parameter power
    # The resultant mapped array is then sent to #inject using #* method
    # First iteration: 2**0 == 1
    # Second iteration: 3**0 == 1
    # Now we would have: [1, 1]
    # And call inject(:*) : [1, 1].inject(:*)
    # would return 1
    # and so on for each iteration...
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end

  divisors.sort
end

time_start = Time.now

puts divisors(180).inspect
puts divisors(1).inspect
puts divisors(7).inspect
puts divisors(17).inspect
puts divisors(12).inspect           
puts divisors(98).inspect           
puts divisors(99400891).inspect      
puts divisors(999962000357).inspect 

time_end = Time.now
puts "Total time: #{time_end - time_start}"

=> [1, 2, 3, 4, 5, 6, 9, 10, 12, 15, 18, 20, 30, 36, 45, 60, 90, 180]
=> [1]
=> [1, 7]
=> [1, 17]
=> [1, 2, 3, 4, 6, 12]
=> [1, 2, 7, 14, 49, 98]
=> [1, 9967, 9973, 99400891]
=> [1, 999979, 999983, 999962000357]
=> Total time: 0.103