# What method could you use to find out if a Hash contains a specific value in it?
# Write a program to demonstrate this use
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts "The hash we are looking at: #{person}"
puts ''

# Checking for two different values in the person hash
puts "'Bob' is in the hash: #{person.has_value?("Bob")}"
puts "'Thunderstorm' is in the hash: #{person.has_value?("thunder storm")}"
