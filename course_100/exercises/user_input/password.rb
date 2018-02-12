
password = 'surfisup'

loop do
  puts "Please enter you password:"
  input = gets.chomp
  break if input == password
  puts "Invalid password!"
end

puts "Welcome!"
