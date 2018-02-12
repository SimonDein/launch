# To make loops more effective and precise, we can add conditional flow control
# within them to alter their behavior
# Let's use an if statement in a while loop to demonstrate

x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end
