=begin
Description:
Tic, tac, toe is a two player game where each player take turns putting a marker on a 3x3 squared board.
The game is over when either:
  - a player makes a 3 in a row
    - the player won
    or
  - the board is full
    - it's a tie


Nouns:
  - player
  - marker
  - board
  - game
  - square
  - full

Verbs:
  - wins
  - is full
  - takes turn
  - play
  - is full
  - marks
  - is over

Organized into groups:
  - player
    - won
    - marks
    - takes turn
  - marker
  - board
    - is full
  - game
    - is over
  - square
=end

class Board
  def initialize
    # We need some way to model the 3x3 grid
    # What data structure should we use?
    # - Array / hash or square objects?
    # - Array / hash of strings or integers?
  end

  def over?
    # A way to determine if the game is over
    # - if someone won
    # - if the board is full
  end
end

class Player
  def initialize
    # Is it a human or a computer?
    # maybe a specefic marker - circle or square
  end

  def takes_turn
    # The player should be able to mark a square
    # - if computer it should do so by itself
    # - if human we ask which square
  end

  def won?

  end
end

class Marker
  def initialize
    # is it a cross or a circle?
  end
end

class Game
  def initialize
    # setup a score?
    # keep track of games played?
  end

  # orchastrates the whole game flow
  def play
    display_welcome_msg
    loop do
      first_player.takes_turn
      break if someone_won? || board_full?

      second_player.takes_turn
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_msg
  end
end