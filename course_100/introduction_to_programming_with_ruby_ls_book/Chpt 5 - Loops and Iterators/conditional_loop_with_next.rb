# Example of a while loop with a control flow and using next to skip an iteration

x = 0

while x <= 10
  if x == 3
    x += 1
    next          # we use the "next" keyword to avoid printing "3" (jump to next iteration)
  elsif x.odd?
    puts x
  end
  x += 1
end
