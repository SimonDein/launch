# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Option 1
def repeat(string, num)
  puts (string + "\n") * num
end

# Option 2
def repeat2(string, num)
  num.times {puts string}
end


repeat("hey", 2)
puts "----------"
repeat2("yo", 4)
