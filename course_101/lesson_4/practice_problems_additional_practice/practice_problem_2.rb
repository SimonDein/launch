# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


# solution 1
sum_of_ages = ages.values.sum
puts sum_of_ages


# solution 2
sum_of_ages = 0
ages.each { |_, age| sum_of_ages += age }
puts sum_of_ages


# solution 3
sum_of_ages = ages.values.inject(:+)
puts sum_of_ages


# solution 4
sum_of_ages = ages.values.inject { |sum, age| sum + age}
puts sum_of_ages


# solution 5
counter = 0
sum_of_ages = 0
keys = ages.keys

loop do
  current_key = keys[counter]
  current_value = ages[current_key]

  sum_of_ages += current_value
  counter += 1

  break if counter >= ages.size
end

puts sum_of_ages
