=begin
What will the following code print?

Answer:
On line 24 the output will be "ByeBye" and nil will be returned
On line 25 the output will be "HelloHello" and nil will be returned
=end

class Something
  def initialize
    @data = 'Hello'
  end
  
  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata