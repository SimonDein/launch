answer = 0

loop do

  loop do
    puts ">> How many times do you want to print. Enter a number >= 3 (Q to quit):"

    answer = gets.chomp.downcase
    if answer.to_i >= 3 || answer == 'q'
      break
    end
    puts "Please enter a number bigger than 3"
  end

  break if answer == 'q'
  puts "Launch School is the best \n" * answer.to_i


end
