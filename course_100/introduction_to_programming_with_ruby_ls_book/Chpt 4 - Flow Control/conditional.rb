# conditional.rb
# Create a file called conditional.rb and type the following code into it.


puts "Give me a number"
a = gets.chomp.to_i

if a == 3
  puts "a is three"
elsif a == 4
  puts "a is four"
else
  puts "a is neither 3, nor 4"
end
