# Non mutating method
def double_numbers(arr_of_numbers)
  doubled_numbers = []
  counter = 0

  loop do
    current_num = arr_of_numbers[counter]
    doubled_numbers << current_num * 2

    counter += 1
    break if counter >= arr_of_numbers.size
  end

  doubled_numbers
end

my_numbers = [4, 74, 23.5, 2]
puts "my numbers before method invocation = #{my_numbers}"
double_numbers(my_numbers)
puts "my numbers after method invocation = #{my_numbers}"


# mutating method
def double_numbers!(arr_of_numbers)
  counter = 0

  loop do
    arr_of_numbers[counter] *= 2

    counter += 1
    break if counter >= arr_of_numbers.size
  end

  arr_of_numbers
end

my_numbers1 = [4, 74, 23.5, 2]
puts "my numbers before method invocation = #{my_numbers1}"
double_numbers!(my_numbers1)
puts "my numbers after method invocation = #{my_numbers1}"
