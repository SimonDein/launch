# Example of a while loop with a control flow and using break to exit

x = 0

while x <= 10
  if x == 7       # Here we check to see if x is 7 - and if so - break the loop (exit the loop)
    break
  elsif x.odd?
    puts x
  end
  x += 1
end
