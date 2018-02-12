require 'minitest/autorun'

class ListTest < Minitest::Test
  def setup
    @list = []
  end
  
  def test_for_empty
    assert_empty(@list)
  end
end