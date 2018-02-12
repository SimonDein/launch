# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument.

def find_fibonacci_index_by_length(digits)
  index = 1
  previous_num = 0
  current_num = 1

  loop do
    index += 1
    fib_num = current_num + previous_num
    
    break if fib_num.to_s.length >= digits
  
    previous_num = current_num
    current_num = fib_num
  end
  index
end

puts  find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847