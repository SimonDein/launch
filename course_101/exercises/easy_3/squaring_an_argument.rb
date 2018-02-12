# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(4) == 16

# Further exploration
# What if we wanted generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?
def power_to_the_n(number, n)
  if n <= 0
    return 1
  else
    multiply(number, power_to_the_n(number, n - 1))
  end
end

puts power_to_the_n(4, 3) == 64
