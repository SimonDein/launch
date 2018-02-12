require 'minitest/autorun'

class ClassTest < Minitest::Test
  def setup
    @value = 2
  end

  def test_value_is_numeric
    assert_instance_of(Numeric, @value) 
  end
end