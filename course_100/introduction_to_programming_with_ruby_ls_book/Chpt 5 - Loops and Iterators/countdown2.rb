# An "until" version of the while loop from countdown.rb
# "Until" works the opposite way of "while"
# Until this condition is met - do this

puts "Give me a positive number"
x = gets.chomp.to_i

until x < 0
  puts x
  x -= 1
end

puts "Done!"
