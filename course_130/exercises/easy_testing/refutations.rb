require 'minitest/autorun'

class RefutationTest < Minitest::Test
  def test_refute_xyz_in_arr
    arr = ['yo', 'hey']

    # passes as arr doesn't hold any string object with the value 'xyz'
    refute_includes(arr, 'xyz')
  end
end