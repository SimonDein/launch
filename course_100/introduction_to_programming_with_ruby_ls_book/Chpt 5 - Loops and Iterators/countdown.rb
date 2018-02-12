# Example of a while loop
# We want this program to countdown from any number given by the user and
# print to the screen each number as it counts.

puts "Give me a positive number"
x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1
end

puts "Done!"
