# Write a while loop that takes input from the user, performs an action,
# and only stops when the user types "STOP". Each loop can get info from the user
iteration = 1

loop do
  puts "You're on round #{iteration}. Enter \"STOP\" to quit. "
  answer = gets.chomp
  if answer == 'STOP'
    break
  end
  iteration += 1
end
