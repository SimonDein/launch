def general_multiply(numbers, multiplier)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter >= numbers.size
    current_num = numbers[counter]

    multiplied_numbers << current_num * multiplier
    counter += 1
  end

  multiplied_numbers
end


my_numbers = [1, 4, 3, 7, 2, 6]
p general_multiply(my_numbers, 4)
