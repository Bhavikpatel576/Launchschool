#output a secret handshake by converting an input value from digit to binary and using the corrisponding key 
#to create an output. 

#example SecreteHandShake.new(9) => 1001 in binary => [1=>wink, 10=>double_wink, 100=>close_jump, 1000=>jump, 10000=>reverse array]
#values that are above 1:1, 2:10, 4:100, 8:1000, 16:10000, 

#19 => 10011
#31 => 11111 => read right to left [wink, double_wink, close_jump, jump, reverse]

require "pry"

class SecretHandshake
  attr_accessor :number
  BINARY_HASH = {10000=>'reverse', 1000=>'jump', 100=>'close your eyes', 10=>'double blink', 1=>'wink'}
  def initialize(number)
    @number = number.to_s.to_i
  end

  def validation
     @number.class == Fixnum && @number.to_i < 32
  end

  def convert_to_binary
    #converting
    initial_value = 16
    result = ""
    while(initial_value > 0)
      remainder = @number/initial_value
      if remainder > 0
        result << "1"
        @number -= initial_value
      else
        result << "0"
      end
      initial_value /= 2
    end
    result.to_i
  end

  def convert_to_secret(binary)
    secret_handshake_values = []
    BINARY_HASH.each do |key, value|
      if binary/key > 0 
        secret_handshake_values << value
        binary -= key
      end
    end
    secret_handshake_values
  end

  def commands
    return [] unless validation
    binary_num = convert_to_binary
    solution = convert_to_secret(binary_num)
    if solution[0] == "reverse"
      return solution[1..-1]
    end
    solution.reverse
  end
end


require 'minitest/autorun'
require_relative 'secret_handshake'

class SecretHandshakeTest < Minitest::Test
  def test_handshake_1_to_wink
    handshake = SecretHandshake.new(1)
    assert_equal ['wink'], handshake.commands
  end

  def test_handshake_10_to_double_blink
    
    handshake = SecretHandshake.new(2)
    assert_equal ['double blink'], handshake.commands
  end

  def test_handshake_100_to_close_your_eyes
    
    handshake = SecretHandshake.new(4)
    assert_equal ['close your eyes'], handshake.commands
  end

  def test_handshake_1000_to_jump
    
    handshake = SecretHandshake.new(8)
    assert_equal ['jump'], handshake.commands
  end

  def test_handshake_11_to_wink_and_double_blink
    
    handshake = SecretHandshake.new(3)
    assert_equal ['wink', 'double blink'], handshake.commands
  end

  def test_handshake_10011_to_double_blink_and_wink
    
    handshake = SecretHandshake.new(19)
    assert_equal ['double blink', 'wink'], handshake.commands
  end

  def test_handshake_11111_to_double_blink_and_wink
    
    handshake = SecretHandshake.new(31)
    expected = ['jump', 'close your eyes', 'double blink', 'wink']
    assert_equal expected, handshake.commands
  end

  def test_valid_string_input
    
    handshake = SecretHandshake.new('1')
    assert_equal ['wink'], handshake.commands
  end

  def test_invalid_handshake
    
    handshake = SecretHandshake.new('piggies')
    assert_equal [], handshake.commands
  end
end
