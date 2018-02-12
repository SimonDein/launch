
# Welcome to class - ask for your name
puts "Hi, welcome to class!"
puts "What's your first name?"
name = gets.chomp.to_s

# If name is wrong casing - get annoyed
if name != name.capitalize
  puts "You mean " + name.capitalize + ", RIGHT?!! yes/no"
  answer = gets.chomp.to_s.downcase

  if answer == "yes"
    puts "...Okay come on in - " + name.capitalize + "!!"
  else
    puts "GET OUT OF MY CLASS!!!"
  end
else
    puts "Welcome to class " + name + ". It's good to see you!"
end
