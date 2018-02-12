def get_name
  name = gets.chomp
  name = 'Teddy' if name.empty?
end

puts "What's your name?"
name = get_name()

random_age = rand(20..200)

puts "#{name} is #{random_age} years old!"
