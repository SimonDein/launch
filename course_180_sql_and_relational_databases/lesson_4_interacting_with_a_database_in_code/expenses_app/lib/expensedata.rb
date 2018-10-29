require 'bundler/setup'
require 'pg'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: 'expenses')
    setup_schema
  end

  def add_expense(amount, memo)
    sql = <<~SQL
    INSERT INTO expenses (amount, memo)
    VALUES
    ($1, $2);
    SQL

    @connection.exec_params(sql, [amount, memo])
  end

  def delete(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql, [id])
    
    if result.ntuples == 1
      sql = "DELETE FROM expenses WHERE id = $1"
      @connection.exec_params(sql, [id])

      puts "The following expense has been deleted:"
      display_expenses(result)
    else
      puts "There is no expense with the id '#{id}'"
    end
  end
  
  def list_expenses
    expenses = @connection.exec('SELECT * FROM expenses')
    display_count(expenses)
    display_expenses(expenses) if expenses.ntuples > 0
  end

  def delete_all_expenses
    @connection.exec('DELETE FROM expenses')

    puts "All expenses has been deleted"
  end

  def search(param)
    sql = <<~SQL
    SELECT * FROM expenses
    WHERE memo ILIKE $1;
    SQL

    result = @connection.exec_params(sql, ["%#{param}%"])
    display_count(result)
    display_expenses(result) if result.ntuples > 1
  end

  private
  
  def setup_schema # Sets up expense table if nonexistant
    @connection.exec(File.read('schema.sql')) if no_expense_table?
  end

  def no_expense_table?
    sql = <<~SQL
    SELECT COUNT(*) FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'expenses';
    SQL
    
    # Returns 1 if table exists - 0 otherwise
    result = @connection.exec(sql)
    result[0]["count"] == "0"
  end

  def db_exist?
    result = @connection.exec("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'expenses';")
    binding.pry
  end

  def display_count(expenses)
    count = expenses.ntuples
    if expenses.ntuples == 0
      puts  "There are no expenses"
    else
      puts "There are #{count} expense#{'s' if count > 1}"
    end
  end
  
  def display_expenses(expenses)
    expenses.each do |row|
      columns = [ row["id"].rjust(3),
                  row["created_on".rjust(10)],
                  row["amount"].rjust(14),
                  row["memo"] ]

      puts columns.join(" | ")
    end
    
    total = expenses.field_values("amount").map(&:to_f).reduce(:+)
    
    puts '-' * 40
    puts "Total#{total.to_s.rjust(27)}"
  end
end