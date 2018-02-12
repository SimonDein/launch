numbers = []

while numbers.length < 5
  rnd_num = rand(100)
  puts rnd_num
  numbers << rnd_num
end


# OR
puts "----"



while numbers.length < 5
  numbers << rand(100)
end

puts numbers
