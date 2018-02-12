def general_selection(hash, selection_criteria)
  counter = 0
  keys = hash.keys
  selected_items = {}

  loop do
    break if counter >= hash.size

    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == selection_criteria
      selected_items[current_key] = current_value
    end

    counter += 1
  end

  selected_items
end




produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_selection(produce, 'Fruit')
