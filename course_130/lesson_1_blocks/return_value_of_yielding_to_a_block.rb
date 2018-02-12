def compare(word)
  puts "Before: #{word}"
  after = yield(word) # capture the return value of the block
  puts "After: #{after}"
end

compare('hi') { |word| word.upcase}
# Before: hello
# After: HELLO
# => nil

