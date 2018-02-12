def step(start_val, end_val, step)
  current_val = start_val
  while current_val <= end_val
    yield(current_val)
    current_val += step
  end
end

puts step(1, 10, 3) { |num| puts "current number = #{num}" }

