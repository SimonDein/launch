require 'minitest/autorun'

class NoExperienceError < RuntimeError
end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionTesting < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_raise_no_experience_error
    assert_raises(NoExperienceError) { @employee.hire}
  end
end