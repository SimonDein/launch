# below we've defined 3 methods performing the arithmetic operations of adding, subtracting and multiplaying

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end


def multiply(a, b)
  a * b
end

# it's possible to pass methods as individual arguments to other methods as long as the methods returns an object
# the other methods can work with - i.e. if one of these returned a string -
# an error would be thrown as the "add" method expects integers as arguments.
puts add(subtract(5, 3), multiply(2, 6))
