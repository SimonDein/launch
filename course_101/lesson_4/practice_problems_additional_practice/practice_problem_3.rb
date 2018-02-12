# In the age hash:
# throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }


# solution 1
ages.select! do |_, age|
  age < 100
end

puts ages


# solution 2
ages.keep_if { |_, age| age < 100}
p ages
