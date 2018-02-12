

require 'minitest/autorun'

class NilTest < Minitest::Test
  def setup
    @value = nil
  end
  
  def test_for_nil
    assert_nil(@value)
  end
end