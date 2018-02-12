def double_odd_indices(numbers)
  index = 0
  doubled_numbers = []

  loop do
    break if index >= numbers.size # the break condition is put at top in case the array passed is empty

    current_num = numbers[index]
    current_num *= 2 if index.odd?

    doubled_numbers << current_num

    index += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)
