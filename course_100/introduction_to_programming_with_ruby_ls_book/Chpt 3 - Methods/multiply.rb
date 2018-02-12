# Write a program that includes a method called multiply that takes two arguments and returns the product of the two numbers.

def multiply(num1, num2)
  num1 * num2 # this will implicitly return as this is the last (and only) evaluation and there's no explicit return
end

puts multiply(2, 4) # puts out the returned value from ::multiply as it otherwise won't be visible (except in irb)
