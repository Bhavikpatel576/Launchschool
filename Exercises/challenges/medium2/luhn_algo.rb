class Luhn
	attr_reader :number
	attr_accessor :digit_array

	def initialize(number)
		@number = number
		@digit_array = number.to_s.split("").map(&:to_i)
	end

	#this will take the original number and determine if it's valid or not
	#this only validates a correct input. Doesn't check for correct input.
	def valid?
		#return false if @number.match?(/[^\d_]/)
		checksum % 10 == 0
	end

	#return a transformed array with the Luhn Algo
	def addends
		luhn_array = @digit_array.reverse.map.with_index(1) do |value, idx|
			if idx.even?
				value = (value * 2 > 10) ? (value * 2 - 9) : (value * 2)
			else
				value
			end
		end
		luhn_array.reverse
	end

	#return the summed value of the array
	def checksum
		addends.reduce(:+)
	end

	#this will add a digit to make the formula correct
	def self.create(digit)
		create_digit = Luhn.new(digit)
		0.upto(9) do |value|
			create_digit.digit_array << value
			break if create_digit.valid?
			create_digit.digit_array.pop
		end
		answer = create_digit.digit_array.join("").to_i
	end
end

# Luhn.new(8_739_567).valid?


require 'minitest/autorun'
require_relative 'luhn_algo'

class LuhnTest < Minitest::Test
  def test_addends
    luhn = Luhn.new(12_121)
    assert_equal [1, 4, 1, 4, 1], luhn.addends
  end

  def test_too_large_addend
    #skip
    luhn = Luhn.new(8631)
    assert_equal [7, 6, 6, 1], luhn.addends
  end

  def test_checksum
    #skip
    luhn = Luhn.new(4913)
    assert_equal 22, luhn.checksum
  end

  def test_checksum_again
    #skip
    luhn = Luhn.new(201_773)
    assert_equal 21, luhn.checksum
  end

  def test_invalid_number
    #skip
    luhn = Luhn.new(738)
    refute luhn.valid?
  end

  def test_valid_number
    #skip
    luhn = Luhn.new(8_739_567)
    assert luhn.valid?
  end

  def test_create_valid_number
    #skip
    number = Luhn.create(123)
    assert_equal 1230, number
  end

  def test_create_other_valid_number
    #skip
    number = Luhn.create(873_956)
    assert_equal 8_739_567, number
  end

  def test_create_yet_another_valid_number
    #skip
    number = Luhn.create(837_263_756)
    assert_equal 8_372_637_564, number
  end
end
	

