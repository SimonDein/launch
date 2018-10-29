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
    when "delete"
      expense_id = cli_arguments[0]
      unless expense_id
        display_delete_error
      else
        application.delete(expense_id)
      end
    when "clear"
      application.delete_all_expenses if confirmed?
    when "list"
      application.list_expenses
    when "search"
      search_param = cli_arguments[0]
      unless search_param
        display_search_error
      else
        application.search(search_param)
      end
    else
      display_help
    end
  end

  private

  def confirmed?
    puts "This will remove all expenses. Are you sure? (y/n)"
    answer = IO.console.getch
    answer == 'y'
  end

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

  def display_delete_error
    puts <<~DELETEERROR
    You must provide an id for expense you wish to delete

    Example:

    delete 2 - This deletes the expense with the id 2 from the list
    DELETEERROR
  end
end