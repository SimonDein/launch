my_enumerator = Enumerator.new do |arr|
  current_num = 1
  next_num = 1
  loop do
    arr << current_num
    current_num = current_num + next_num
    next_num + current_num

  end
end



# On each iteration we want to add the factorial of current num to arr

# 