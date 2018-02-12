# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'

class ValueTest < Minitest::Test
  def setup
    @value = 4
  end
  
  def test_value_is_odd
    assert(@value.odd?, 'Value is not odd')
  end
end

# => Failure - value is not odd

=begin
#assert fails unles the passed argument is truthy.
It's not vary commom to utalize the method in serious testing as it's not very specific
and if we fx. wanted to assert for a specific boolean object like true - we could use something
like #assert_equal isntead.
=end