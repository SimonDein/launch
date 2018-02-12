# Write a method that takes an optional block.
# If the block is specified, the method should execute it, and return the value returned by the block.
# If no block is specified, the method should simply return the String 'Does not compute.

def compute
  block_given? ? yield : 'Does not compute.'
end

# Examples:
compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'