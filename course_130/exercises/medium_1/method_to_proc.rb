# Fill in the missing part of the following code so we can convert an array of integers to base 8

def convert_to_base_8(n)
  # to_s(n) returns a sring version of radix 8 (base-n) for n we then turn into an int
  n.to_s(8).to_i 
end

# Object#method(sym) returns a Method object - which acts as a closure
base8_proc = method(:convert_to_base_8).to_proc

# We turn the proc into a block with Ruby's "proc to block" operator - &
p [8,10,12,14,16,33].map(&base8_proc)