# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block.
# Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.


# solution 1
BLOCK_LETTERS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  up_string = string.upcase
  block_word = true
  BLOCK_LETTERS.each do |block_combination|
    block_word = false if string.count(block_combination) > 1
  end
  block_word
end

# solution 2
def block_word?(string)
  up_string = string.upcase
  BLOCK_LETTERS.none? { |block| string.count(block) >= 2}
end


puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true