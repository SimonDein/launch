# Use the each_with_index method to iterate through an array of your creation
# that prints each index and value of the array

# Array of items
skateboard_elements = ["deck", "trucks", "wheels", "bearings", "griptape", "nuts & bolts"]


puts "To make a full skateboard setup you'd need"
skateboard_elements.each_with_index do |item, index|
  puts "#{(index + 1)}. #{item}" # adding 1 to index so it starts at one instead of 0
end
