class GoodDog
  attr_accessor :name, :height, :weight # attr_accessor defines a reader and writer method and instance variables @hame

  def initialize(n, h, w) # method automatically called on instansiation of an object from the class
    @name = n
    @height = h
    @weight = w
  end

  def speak # instance method of the GoodDog class
    "#{name} says arrrfh!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} kg and is #{self.height}cm tall"
  end
end

fido = GoodDog.new('Fido', 53, 6) # fido is initialized with the GoodDog.new mehtod-
                           # and the argument passed is passed to the initialize method defined

puts fido.info
fido.change_info('Sparky', 120, 5)

puts fido.info