require_relative 'expensedata'

class  CLI
  attr_reader :command, :amount, :memo, :application
  
  def initialize
    @application = ExpenseData.new
  end

  def run(cli_arguments)
    command = cli_arguments.shift

    
    
    case command
    when "add"
      amount = cli_arguments[0]
      memo = cli_arguments[1].dup.capitalize!
      unless amount && memo
        display_add_expense_error
      else
        application.add_expense(amount, memo)
      end
    when "list"
      application.list_expenses
    else
      display_help
    end  
  end

  private

  def display_help
    puts <<~HELP
    An expense recording system
    
    Commands:
    
    add AMOUNT MEMO [DATE] - record a new expense
    clear - delete all expenses
    list - list all expenses
    delete NUMBER - remove expense with id NUMBER
    search QUERY - list expenses with a matching memo field
    HELP
  end
  
  def display_add_expense_error
    puts <<~ADDERROR
    You have to provide an amount and a memo
  
    Example:
  
    add 1.4 Coffee
    ADDERROR
  end
end