# This is a valid answer to the exercise - though we do not have the answer of the user after the loop ends
# as the variable we store the answer in is inside the loop

loop do
  puts "Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase

  if answer == 'y'
    puts "something"
    break
  elsif answer == 'n'
    break
  else
    puts "Invalid input! Please enter 'y' or 'n'"
  end
end


# A solution where we keep the answer of the user after the loop ends:

answer = nil

# Here the loop is only used to retrieve a valid answer (defined by us a 'y' or 'n')
# and then we execute anything we want depending on the answer - after the loop.
loop do
  puts "Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase

  if %w{y n}.include?(answer)
    break
  end

  puts "Invalid answer - please try again."
end
puts "something" if answer == 'y'
