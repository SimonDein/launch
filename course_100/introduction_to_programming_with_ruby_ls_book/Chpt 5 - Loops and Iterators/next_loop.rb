# Same example as "conditional_loop.rb" - but this time we will skip 4

i = 0

loop do
  i += 2
  if i == 4
    next        # skip the rest of the code in this iteration (and start from the top again)
  elsif i > 10
    break
  else
    puts i
  end
end # => 2, 6, 8, 10
