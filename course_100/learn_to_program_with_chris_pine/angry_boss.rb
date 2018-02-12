# Write an angry boss program that rudely asks what you want.
# Whatever you answer, the boss should yell it back to you and then fire you.

puts "IS IT YOU AGAIN?!"

while true
  puts "WHAT DO YOU WANT?!"
  answer = gets.chomp

  boss_yells = "WHADDAYA MEAN " + answer.upcase + "?!? YOU'RE FIRED!!"

  unless answer.is_a? Integer
    puts "SPEAK A LANGUAGE HUMANS UNDERSTAND"
  else
    puts boss_yells
    break
  end
end
