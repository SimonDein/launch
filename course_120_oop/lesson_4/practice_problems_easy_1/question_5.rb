# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin
Only the Pizza class has an instance variable (@name).
An instance variable are defined by prepending the variable by '@' in a method definition.

You can also check by calling the Object#instance_variables on an instatiated object of both classes:
=end

pizza = Pizza.new('calzone')
fruit = Fruit.new('banana')

p pizza.instance_variables #=> [:@name]
p fruit.instance_variables #=> []