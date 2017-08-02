# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number

class PerfectNumber
	attr_reader :number

	def self.classify(number)
		PerfectNumber.new(number).classify
	end

	def initialize(number)
		@number = number
	end

	def multiples
		multiples = 1.upto(number).select {|v| number%v == 0}
	end

	def prime?
		multiples.length == 2
	end

	def classify
		raise RuntimeError if number <= 0 
		sum = multiples.reduce(&:+) - number
		if prime? || sum < number
			return 'deficient'
		elsif sum > number
			return 'abundant'
		elsif sum == number
			return 'perfect'
		end
	end
end
			
require 'minitest/autorun'
require_relative 'perfect_number'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end
