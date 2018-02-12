numbers = []

loop do
  puts "Enter any number:"
  input = gets.chomp.to_i
  
  numbers << input
  if numbers.length == 5
    break
  end
end

puts "---"
puts numbers
