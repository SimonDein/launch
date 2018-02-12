# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
# The ASCII string value is the sum of the ASCII values of every character in the string.
# (You may use String#ord to determine the ASCII value of a character.)

# solution 1
# def ascii_value(str)
#   str.chars.map { |char| char.ord}.sum
# end

# solution 2
def ascii_value(str)
  str.chars.inject(0) { |sum, char| sum + char.ord}
end


puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
