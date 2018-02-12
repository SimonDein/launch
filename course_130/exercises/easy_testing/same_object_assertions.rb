require 'minitest/autorun'

class List
  def process
    self
  end
end

class SameObjectTest < Minitest::Test
  def setup
    @list = List.new
  end

  def test_for_same_obj
    assert_same(@list, @list.process)
  end
end