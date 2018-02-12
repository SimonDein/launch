# Write a program that solicits 6 numbers from the user -
# then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

obtained_numbers = []

# solution 1
5.times do |iteration|
  puts "=> Enter the #{(iteration + 1)}. number"''
  num = gets.chomp.to_i
  obtained_numbers << num
end

puts "=> Enter the last number"
last_num = gets.chomp.to_i

if obtained_numbers.include?(last_num)
  puts "#{last_num} is in the array: #{obtained_numbers}!"
else
  puts "#{last_num} is not in the array: #{obtained_numbers}!"
end
