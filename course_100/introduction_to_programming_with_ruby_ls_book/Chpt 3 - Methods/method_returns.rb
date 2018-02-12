# example of what Ruby will return

# Ruby methods ALWAYS return the evaluated result of the last line of the expression unless an explicit return comes before it
def add_three(number)
  return number + 3
end

returned_value = add_three 12
puts returned_value

# in this example ruby is explicitly told to return an evaluation
# that means ruby will return the evaluated value of "number + 7" without executing any lines after
def add_seven(number)
  return number + 7 # this will be returned and ruby will not evaluate anyting after
  # !!
  number + 42 # this will not return as an explicit "return" has been stated before it
end

returned_value = add_seven 12
puts returned_value
