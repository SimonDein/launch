# Build a command line calculator program that does the following:
  # asks for two numbers
  # asks for the type of operation to perform: add, subtract, multiply or divide
  # displays the result


# ---------- Load messages from yml file ----------
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message) # appends the message to the user for visability
  puts "=> #{message}"
end


# ---------- Validation methods ----------
def integer?(n)
  n.to_i.to_s == n
end

def float?(n)
  n.to_f.to_s == n
end

def number?(n)
  integer?(n) || float?(n)
end

def validate_num # Method for retrieving and validating a number from the user
  loop do
    n = gets.chomp
    if number?(n) && n.to_i >= 0
      if integer?(n) # If an integer was entered - return an integer - else return as float
        return n.to_i
      else
        return n.to_f
      end
    end
    prompt(MESSAGES['validate_num_error'])
  end
end


# ---------- Basic arithmetic methods ----------
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
  prompt(MESSAGES['instructions'])

  # Ask for two numbers
  prompt("Please enter the first number")
  num1 = validate_num()

  prompt("Please enter the second number")
  num2 = validate_num()

  # Ask for operation to perform
  op = '' # operation to be performed
  prompt(MESSAGES['op_instructions'])
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

  prompt(MESSAGES['want_to_use_again'])
  calculate_again = gets.chomp
  break unless calculate_again.downcase.start_with?('y')
end
prompt(MESSAGES['goodbye'])
