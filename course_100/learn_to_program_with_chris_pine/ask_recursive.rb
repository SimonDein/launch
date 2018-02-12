
# Method for returning false or true depending on reply
def ask question
  puts question
  reply = gets.chomp.downcase
  puts ""

  if reply == 'yes'
    return true
  elsif reply == 'no'
    return false
  else
    puts "Please reply 'yes' or 'no'."
    ask question
  end
end


ask "Do you like chicken?"
ask "Do you like raw shrimp?"
wet_the_bed = ask "Do you wet the bed?"
ask "Do you like beef?"


if wet_the_bed == true
  puts "Hah! You're a bedwetter!"
else
  puts "Ahh, i see you won't admit to being a bedwetter!"
  puts "It's important to be honest!"
end
