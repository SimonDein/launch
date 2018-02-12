require 'minitest/autorun'

class ValueClassTest < Minitest::Test
  def setup
    @value = 5
  end

  def test_for_value_kind_of_numeric
    assert_kind_of(Numeric, @value)
  end
end