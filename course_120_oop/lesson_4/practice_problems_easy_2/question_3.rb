# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

=begin
Answer:
To see the method lookup path of any class - we can call the #ancestors method on it.
Invoking the #ancestors method on any class will return the method lookup path by which ruby traverses
to find any method invoked
=end

p HotSauce.ancestors #=> [HotSauce, Taste, Object, Kernel, BasicObject]
p Orange.ancestors #=> [Orange, Taste, Object, Kernel, BasicObject]