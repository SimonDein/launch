# Example of a method that modifies its argument permanently

a = [1, 2, 3]

def mutate(array)
  array.pop # pop is a method of the Array class and will permanently mutate an array passed
end

p "Before mutate method: #{a}"
p mutate a
p "After mutate method: #{a}"
