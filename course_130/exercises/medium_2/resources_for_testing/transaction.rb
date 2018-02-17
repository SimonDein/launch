require 'pry'

# transaction.rb

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  def prompt_for_payment(input, output) # we've set a default parameter for stdin
    loop do
      output.puts "You owe $#{item_cost}.\nHow much are you paying?"
      # @amount_paid = gets.chomp.to_f
      self.amount_paid = input.gets.chomp.to_f # for testing purposes
      break if valid_payment? && sufficient_payment?
      output.puts 'That is not the correct amount. ' \
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