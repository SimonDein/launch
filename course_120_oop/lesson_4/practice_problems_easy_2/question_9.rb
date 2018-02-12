# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class,
# keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

=begin
Answer:
If we call the the play method on an instance of Bingo - the Bingo#play method will be called instead.
Ruby allways looks for a method in the class from which the object calling comes from first -
then any includede modules and then it's superclass - continuing all the way back to the BasicObject class.
=end
