# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:
hello = Hello.new
hello.hi          # "Hello" => nil


# case 2:
hello = Hello.new
hello.bye         #=> NoMethodError - undefined method 'bye' for Hello object


# case 3:
hello = Hello.new
hello.greet       #=> ArgumentError (given 0, expected 1)

# case 4:
hello = Hello.new
hello.greet("Goodbye") # "Goodbye" => nil

# case 5:
Hello.hi            # NoMethodError - undefined method 'hi' for Hello:class