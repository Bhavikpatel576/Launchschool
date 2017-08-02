
require 'minitest/autorun'

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end

require_relative 'transaction'

class TransactionTest < MiniTest::Test

  def setup
    @transaction1 = Transaction.new(100)
    @transaction2 = Transaction.new(200)
    @transaction3 = Transaction.new(200)
    @all_tranactions = [@tranaction1, @tranaction2, @transaction3]
  end

  def test_prompt_for_payment
    t2 = Transaction.new(1500)
    input = StringIO.new('30\n')
    t2.prompt_for_payment(input: input)
    assert_equal 30, t2.amount_paid
  end

end

