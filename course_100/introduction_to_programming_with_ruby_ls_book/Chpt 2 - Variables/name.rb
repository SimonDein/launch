# Write a program called name.rb that asks the user to type in their name and then prints out a greeting message with their name included.

puts "Hey, what's your first name?"
first_name = gets.chomp
puts "And your last name?"
last_name = gets.chomp

puts "\nGood to see you #{first_name} #{last_name}!"

puts ""

# Add another section onto name.rb that prints the name of the user 10 times.
# You must do this without explicitly writing the puts method 10 times in a row.
10.times do
  puts first_name + " " + last_name
end
