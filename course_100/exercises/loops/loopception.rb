loop do
  puts "this is the outer loop."
  loop do
    puts "this is the inner loop."
    break
  end
  break
end
