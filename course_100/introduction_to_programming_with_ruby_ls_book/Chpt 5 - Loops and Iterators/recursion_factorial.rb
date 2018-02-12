# Example of how recursion works

def factorial(num)
  if num == 1
    return num
  else
    return num * factorial(num - 1)
  end
end

puts factorial(4)
