# Given this nested Hash below -
# figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# solution 1
total_age_of_males = 0
munsters.each do |person, info|
  total_age_of_males += info["age"] if info["gender"] == "male"
end

p total_age_of_males # => 444


# solution 2
total_age_of_males = 0
munsters.each_value do |info|
  total_age_of_males += info["age"] if info["gender"] == 'male'
end # => 444
