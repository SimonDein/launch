# Add conditions inside a loop printing all even numbers from 0 up to 10

i = 0

loop do
  puts i
  i += 2
  if i > 10
    break # when the above condition is met - this will break the loop
  end
end # => 0, 2, 4, 6, 8, 10
