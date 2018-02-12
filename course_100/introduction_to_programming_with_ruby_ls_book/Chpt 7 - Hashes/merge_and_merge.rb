# Look at Ruby's merge method. Notice that it has two versions
# What is the difference between merge and merge!?
# Write a program that uses both and illustrate the differences

# // Hash.merge(other_hash) method
# Returns a new hash containing the contents of other_hash and Hash.
# If no block is specified, the value for duplicate keys will be of other_hash

hash_one = {name: "Kim",
            age: 23,
            home: "Sweden",
           }

hash_two = {sport: "Tennis",
            age: 58,
            level: "competitive"
          }

# When we merge the hashes without the "!", we keep the two original hashes intact
# So if we inspected hash_one and hash_two now, they'd both be "intact"
no_mutate_hash = hash_one.merge(hash_two)

# But here we mutate the caller, and so hash one will from here be a merged (and mutated) version of both hashes
# Hash_two will stay the same
mutate_hash = hash_one.merge!(hash_two)

puts ''
puts "This is the two hashes merged non destructive:"
p no_mutate_hash

puts ''
puts "This is the two hashed merged destructively:"
p mutate_hash
puts ''

puts "hash_one is now mutated: #{hash_one}"
puts "But hash_two is not: #{hash_two}"
