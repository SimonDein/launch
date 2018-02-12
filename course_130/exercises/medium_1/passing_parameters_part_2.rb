# Based on the examples shown above, write a method that takes an array as an argument.
# The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

def types(aquatic)
  yield(aquatic)
end

aquatic_animals = ["gorilla", "giraffe", "hump back whale", "shark", "tuna", "blue marlin"]

types(aquatic_animals) do |_, _, *aquatic| # Ignore the first to entries and assign the rest of array to the *aquatic variable
  puts "Animals of the sea: #{aquatic.join(", ")}"
end