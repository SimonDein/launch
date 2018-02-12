# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'

class ValueTest < Minitest::Test
  def test_for_xyz
    assert_equal('xyz', convert_to_lowercase('XYZ'))
  end
end

def convert_to_lowercase(input)
  input.downcase
end