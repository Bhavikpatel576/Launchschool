
class CashRegister
  attr_reader :total_money

  def initialize(total_money)
    @total_money = total_money
  end

  def change(transaction)
    transaction.amount_paid - transaction.item_cost
  end

  def give_receipt(transaction)
    puts "You've paid $#{transaction.item_cost}."
  end

  def accept_money(transaction)
    @total_money += transaction.amount_paid
  end

  def start_transaction(transaction)
    transaction.prompt_for_payment
    accept_money(transaction)
    change(transaction)
    give_receipt(transaction)
  end
end

require 'minitest/autorun'
# require 'minitest/reporter'
# Minitest::Reporter.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

	def setup
		@register = CashRegister.new(1000)
	end

	def test_accept_money
		@initial_money = CashRegister.new(1000)
		@transaction1 = Transaction.new(50)
		@transaction1.amount_paid = 50
		@initial_money.accept_money(@transaction1)
		assert_equal(1050, (@initial_money.total_money))
  end

  #difference between what was paid and cost
  def test_change
  	@t2 = Transaction.new(100)
  	@t2.amount_paid = 49.99
  	changed_returned = @t2.amount_paid - @t2.item_cost
  	assert_equal(changed_returned, @register.change(@t2))
  end

   def test_give_receipt
  	@t2 = Transaction.new(100)
  	cost = @t2.item_cost
  	output = "You've paid $#{cost}.\n"
  	assert_output(output) do 
  		@register.give_receipt(@t2)
  	end
  end

end






