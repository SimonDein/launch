puts "What is your name?"
name = gets.chomp

if name.end_with?('!')
  name.chop!
  puts "HELLO #{name}! WHY ARE WE YELLING?!"
else
  name.capitalize!
  puts "Hello #{name}."
end
