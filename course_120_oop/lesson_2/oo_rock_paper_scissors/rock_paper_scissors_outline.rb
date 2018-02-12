=begin
The classical approach to object oriented programming is:

#1 Write a textual description of the problem or exercise.
#2 Extract the major nouns and verbs from the description.
#3 Organize and associate the verbs with the nouns.
#4 The nouns are the classes and the verbs are the behaviors or methods.


Description of problem / exercise:
  Rock, paper, scissors is a two-player game where each player chooses a on of three possible
  moves: rock, paper or scissor.
  Then each move is compared to determine a winner or a tie:
    - rock beats scissor
    - scissor beats paper
    - paper beats rock

  If both players picked the same move - it's a tie


Extract the major nouns and verbs:
  Nouns:
    Player
    Move
    Rule
    
  Verbs:
    Compare
    Choose


Organize the associated vebs and nouns:
  Player
    - Choose
  
  Move

  Rule

    - compare       Not sure where this goes yet  
=end

# CODE

class Player
  def initialize
    # Possibly with a name?
    # Maybe a score for the player too?
  end
  
  def choose
    
  end
end

class Move
  # Seems like we need something to keep track of the choice
  # A Move object could be: rock, paper or scissors
end

class Rule
  def initialize
    # not sure what state of the rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)
  
end


# We need some sort of "engine" to orhestrate the objects
# This is where the procedural program flow should be

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Player.new
    @computer = Player.new
  end

  display_welcome_message
  human.choose
  computer.choose
  display_winner
  display_goodbye_message
end