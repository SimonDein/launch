# Example of asssertion style testing

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  def setup # Runs before every test. Use this to set up before each test run.
    @car = Car.new
  end
  
  def test_wheels
    assert_equal(4, @car.wheels) # fails unless (exp == act)
  end

  def test_car_exists 
    assert(@car)                 # fails unless test is truthy - i.e. the object exists
  end

  def test_name_is_nil
    assert_nil(@car.name)        # fails unless the argument returns nil
  end

  def test_raise_error_initialize_with_arg
    assert_raises(ArgumentError) do
      @car = Car.new(name: "Joey") # this code raises ArgumentError, so this assertion passes
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car) # fails unless the argument passed is of the class specified
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car) # fails unless the argument passed is in the collection specified
  end
end