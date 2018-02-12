# Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public,
# so joe.grade will raise an error.
# Create a better_grade_than? method, that you can call like so:
# puts "Well done!" if joe.better_grade_than?(bob)

class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end
  
  protected

  def grade
    @grade
  end
end

steve = Student.new('Steve', 87)
randall = Student.new('Randall', 76)
puts "Well done!" if steve.better_grade_than?(randall)