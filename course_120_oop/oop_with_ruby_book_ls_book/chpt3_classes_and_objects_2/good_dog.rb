
class GoodDog
  @@total_dogs = 0

  attr_accessor :name, :age
  
  def initialize(n, a)
    self.name = n
    self.age = a

    @@total_dogs += 1
  end

  def self.total
    @@total_dogs
  end
end

fido = GoodDog.new('Fido', 3)
puts fido.name
puts fido.age
puts GoodDog.total