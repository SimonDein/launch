# Build a command line calculator program that does the following:
  # asks for two numbers
  # asks for the type of operation to perform: add, subtract, multiply or divide
  # displays the result

instructions = <<-MSG
HOW THE CALCULATOR WORKS:
  1) You'll be prompted to enter two numbers - NOTE: all numbers must be positive and bigger than 0
  2) Choose the operation: add, subtract, multiply or divide
  3) The result is printed

MSG

op_instructions = <<-MSG
Please enter one of the following operations (in all lowercase):
  add
  subtract
  multiply
  divide
MSG

def prompt(message) # appends the message to the user for visability
  puts "=> #{message}"
end

def validate_num # Method for retrieving and validating a number from the user
  loop do
    n = gets.chomp.to_f
    if n.is_a?(Numeric) && n > 0
      return n
    end
    prompt("A valid entry is: a number bigger than 0 - please try again.")
  end
end

# Basic arithmetic methods
def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def multiply(num1, num2)
  num1 * num2
end

def divide(num1, num2)
  num1 / num2
end


# ------------ Calculator --------------
loop do # main loop
  # Intructions
  prompt(instructions)

  # Ask for two numbers
  prompt("Please enter the first number")
  num1 = validate_num()

  prompt("Please enter the second number")
  num2 = validate_num()

  # Ask for operation to perform
  op = '' # operation to be performed
  prompt(op_instructions)
  loop do
    op = gets.chomp

    if %w(add subtract multiply divide).include?(op)
      break
    end
    prompt("#{op} is not a valid option - try again.")
  end

  result =  case op
            when 'add'
              op_sym = '+'
              add(num1, num2)
            when 'subtract'
              op_sym = '-'
              subtract(num1, num2)
            when 'multiply'
              op_sym = '*'
              multiply(num1, num2)
            when 'divide'
              op_sym = '/'
              divide(num1, num2)
            end

  # Print result
  prompt("#{num1} #{op_sym} #{num2} = #{result}")

  prompt("Would you like to do another calculation? (Enter 'Y' to continue)")
  calculate_again = gets.chomp
  break unless calculate_again.downcase.start_with?('y')
end
prompt("Thank you for using the calculator. Good bye!")
