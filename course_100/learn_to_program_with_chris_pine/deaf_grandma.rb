require "pry"

puts "Hey son, granny is just eating lemon cake -  want some?"
puts ""

input = ""
bye = 0


while bye < 3
input = gets.chomp

  # added function - you got to say "BYE" 3 times in a row to quit
  if input == "BYE"
    bye += 1
    binding.pry
  else
    bye = 0
  end

  if input != input.upcase or input == ""
    # granny yells to speak up
    puts "HUH?! SPEAK UP, SONNY!"
  else
    # checks to see if "BYE has been said 3 times in a row
    if bye >= 3
      break
    else
      # granny yells "not since" - random year
      rand_year = rand(30..50)
      puts "YEAH?! NOT SINCE 19#{rand_year}!!"
    end
  end

end
puts "Yeah bye bye little sonny, now say hi to yo momma from me!".upcase
