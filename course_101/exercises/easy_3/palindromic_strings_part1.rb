# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
# A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def string_palindrome?(str)
  str == str.reverse
end


# Further Exploration
# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array.
# Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome.
# You may not use an if, unless, or case statement or modifier.

def arr_palindrome?(arr)
  arr == arr.reverse
end

# as both the string and array object have a reverse method and with the same name space - we can just call
# it on and array or string without making a difference.
def palindrome?(obj)
  obj == obj.reverse
end


puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
