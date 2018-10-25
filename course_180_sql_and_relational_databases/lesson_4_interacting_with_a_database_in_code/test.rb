require 'pg'

connection = PG.connect(dbname: "working_with_relational_databases_in_code")
result = connection.exec("SELECT * FROM films")
p result[1]