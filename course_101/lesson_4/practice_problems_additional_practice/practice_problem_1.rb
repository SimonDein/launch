# Given the array below
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_positions = {}

flintstones.each_with_index do |name, index|
  flintstones_positions[name] = index
end

p flintstones_positions
