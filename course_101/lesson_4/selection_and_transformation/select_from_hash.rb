def select_fruits(hash)
  selected_key_value = {}
  counter = 0
  keys = hash.keys

  loop do
    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selected_key_value[current_key] = current_value
    end

    counter += 1
    break if counter >= hash.size
  end

  selected_key_value
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruits(produce)
