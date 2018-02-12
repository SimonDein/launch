# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.
# This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.
# If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

# solution 1
def real_palindrome?(str)
  stripped_string = ""
  str.each_char { |char| stripped_string << char.downcase if char > "A"}
  stripped_string == stripped_string.reverse
end

# solution 2
def real_palindrome?(str)
  str = str.gsub(/[^a-zA-Z0-9]/, '').downcase
  str == str.reverse
end

# solution 3
def real_palindrome?(str)
  string = str.delete("^a-zA-z0-9").downcase
  string == string.reverse
end


puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
