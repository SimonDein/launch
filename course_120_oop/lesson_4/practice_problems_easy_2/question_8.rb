#If we have this class:

class Game
  def play
    "Start the game!"
  end
end
And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?

# Answer:
# We can just make it subclass from Game:

class Game
  def play
    "Start the game!"
  end
end
And another class:

class Bingo < Game # Now the method is available to the Bingo class
  def rules_of_play
    #rules of play
  end
end

Bingo.new.play #=> "Start the game!"