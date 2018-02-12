# Write a program that takes a number from the user between 0 and 100 and
# reports back whether the number is between 0 and 50, 51 and 100, or above 100.

puts "Give me a number between 0 and 100"
num = gets.chomp.to_i

if num >= 0 && num < 51
  puts "#{num} is between 0 and 50"
elsif num > 50 && num <= 100
  puts "#{num} is between 51 and 100"
elsif num > 100
  puts "#{num} is bigger than 100!"
else
  puts "#{num} is smaller than 0...try again"
end
