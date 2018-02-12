# Example of a do/while loop

# This loop is almost identical to a "while loop"
loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end
