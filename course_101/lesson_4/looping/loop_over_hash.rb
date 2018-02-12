number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}

pets = number_of_pets.keys

counter = 0

loop do
  current_pet = pets[counter]
  number_of_current_pet = number_of_pets[current_pet]

  puts "I have #{number_of_current_pet} #{current_pet}!"
  counter += 1
  break if counter >= pets.size
end
