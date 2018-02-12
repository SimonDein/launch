# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# solution 1
def balanced?(string)
  brackets = 0
  string.chars.each do |char|
    brackets += 1 if char == '('
    brackets -= 1 if char == ')'
    break if brackets < 0
  end
  brackets == 0 ? true : false
end

# puts balanced?('What (is) this?') == true
# puts balanced?('What is) this?') == false
# puts balanced?('What (is this?') == false
# puts balanced?('((What) (is this))?') == true
# puts balanced?('((What)) (is this))?') == false
# puts balanced?('Hey!') == true
# puts balanced?(')Hey!(') == false
# puts balanced?('What ((is))) up(') == false