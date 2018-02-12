# Example file showing how case statements in Ruby works


# // Example 1
# This example is alot like the one in conditional.rb
# We define a case - here "a" - and set conditions deciding which code gets executed

a = 5

case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a i neither 5, nor 6"
end


# // Example 2 - this way we don't have to write puts so many times
# It's possible to save the evaluation of a case into a variable
# !Note that if we had set the action to - puts "a is (whatever)" - the answer variable would be set to nil.
# !This is because puts RETURNS nil

answer = case a
when 5
  "a is 5"
when 6
  "a is 6"
else
  "a i neither 5, nor 6"
end

puts answer
