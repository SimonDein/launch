require 'pg'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: 'expenses')
  end

  def add_expense(amount, memo)
    sql = <<~SQL
    INSERT INTO expenses (amount, memo)
    VALUES
    ($1, $2);
    SQL

    @connection.exec_params(sql, [amount, memo])
  end
  
  def list_expenses
    result = @connection.exec('SELECT * FROM expenses')
    
    result.each do |row|
      columns = [ row["id"].rjust(3),
                  row["created_on".rjust(10)],
                  row["amount"].rjust(14),
                  row["memo"] ]
    
      puts columns.join(" | ")
    end
  end
end