def doubler(num)
  puts num
  if num < 10
    doubler(num * 2)
  end
end

puts doubler(2)
