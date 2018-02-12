def test(&block)
  puts "What's a &block? #{block}"
end

test { sleep(1)}
# What's a &block? #<Proc:0x007f957413a388@methods_with_explicit_block_parameters.rb:5
# => nil