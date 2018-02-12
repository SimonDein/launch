# passing an argument to a block 
def increment(num)
  incremented_num = num +1
  if block_given?
    yield(incremented_num) # here we pass the argument to the block
  else
    incremented_num
  end
end

increment(5) { |num| puts num} # The local block variable num is assigned to the argument passed
# OR
increment(5) do |num| # The local block variable num is assigned to the argument passed
  puts num
end
# 6
# => nil