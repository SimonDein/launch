

def divide (num, divisor)
  begin
    result = num / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(0, 2)
puts divide(5, 0)
