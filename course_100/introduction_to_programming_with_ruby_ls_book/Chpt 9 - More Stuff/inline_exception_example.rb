# Inline example of using rescue

zero = 0

puts "This is before the call"
zero.each {|num| puts num} rescue puts "Can't do that!"
puts "This is after the call"
