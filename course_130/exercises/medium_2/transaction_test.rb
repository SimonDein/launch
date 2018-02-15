require 'minitest/autorun'
require 'stringio'

require_relative 'resources_for_testing/transaction.rb'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(30)
  end
  
  def test_prompt_for_payment
    # returns a new StringIO object
    # - commonly used to simulate user input
    input = StringIO.new("50\n")
    output = StringIO.new # we use this StringIO mock to silenty "print" the prompts in prompt_for_payment
    
    @transaction.prompt_for_payment(input, output) # Pass in the simulated input
    assert_equal(50, @transaction.amount_paid)
  end
end