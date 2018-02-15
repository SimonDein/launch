require 'minitest/autorun'
require 'stringio'

require_relative 'resources_for_testing/cash_register.rb'
require_relative 'resources_for_testing/transaction.rb'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(40)
  end

  def test_accept_money
    @transaction.amount_paid = 40
    
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(previous_amount + 40, current_amount)
  end

  def test_change
    @transaction.amount_paid =  50

    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end