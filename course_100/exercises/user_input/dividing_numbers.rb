def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil
result = nil

puts "The result is: #{result}"

loop do
  puts ">> Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid input"
end

loop do
  puts ">> Please enter the denominator:"
  denominator = gets.chomp
  if denominator == '0'
    puts "You can't devide by 0 - please try again"
    next
  end
  break if valid_number?(denominator)
end

result = numerator.to_i / denominator.to_i
puts "#{numerator} devided by #{denominator} is #{result}"
