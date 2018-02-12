=begin
When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class, both with separate names and ages?
=end

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# Answer:
# We instatiate two objects and pass in different values for the intialize method
cat1 = AngryCat.new(2, 'Snowball')
cat2 = AngryCat.new(4, 'Smiles')

# We can then check the states of the objects by inspecting them and print it to the output:
p cat1 #=> #<AngryCat:0x007faede8e50f0 @age=2, @name="Snowball">
p cat2 #=>  #<AngryCat:0x007faede8d78b0 @age=4, @name="Smiles">