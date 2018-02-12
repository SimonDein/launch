for i in 1..100
  puts i if i % 2 != 0
end

# OR
puts "----"

for i in 1..100
  puts i if i.odd?
end
