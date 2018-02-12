fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_fruit = fruits[counter]

  transformed_elements.push(current_fruit + 's')

  counter += 1
  break if counter >= fruits.size
end

puts transformed_elements
