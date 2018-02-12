# Write a method that takes a string as argument
# The method should return the all-caps version of the string, only if the string is longer than 10 characters
# Example: change "hello world" to "HELLO WORLD"

def ten_letter_upcase(string)
  # if the length of string is equal to or bigger than 10 - return the string upcased
  if string.to_s.length > 10
    string.upcase # implicit return
  else
    return # returns nothing - i.e. nil
  end
end

puts ten_letter_upcase("Hello World!") # => HELLO WORLD!
puts ten_letter_upcase("Ruby") # => nil
