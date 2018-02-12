require 'minitest/autorun'

class ListIncludedObjectsTest < Minitest::Test
  def setup
    @list = ['xyz', 4, false]
  end
  
  def test_list_include_xyz
    assert_includes(@list, 'xyz')
  end
end