puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip_percentage = gets.to_i

tip = (bill * tip_percentage) / 100
total = bill + tip

puts "The tip is $#{format("%#.2f", tip)}"
puts "The total is $#{format("%#.2f", total)}"
