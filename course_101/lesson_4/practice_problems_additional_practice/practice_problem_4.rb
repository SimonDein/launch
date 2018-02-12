# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# solution 1
minimun_age = ages.values.inject { |minimun_age, age| minimun_age <= age ? minimun_age : age}
p minimun_age


# solution 2
minimun_age = ages.values.min
p minimun_age
