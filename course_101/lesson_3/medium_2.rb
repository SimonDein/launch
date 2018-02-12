# Question 3
# print out is going to be:
# => My string looks like this now: pumpkins
# => My array looks like this now: ["pumpkins", "rutabaga"]

# The string is passed in - but immediatly re-assigned - and never returned and captured again outside the method
# The array is passed as an argument AND mutated in memory inside the method and therefore also will be altered outside though
# it's never "captured" back into a variable (it's mutated in place).


# Question 5
def color_valid(color)
  if %w(blue green).include?(color)
    true
  else
    false
  end
end
