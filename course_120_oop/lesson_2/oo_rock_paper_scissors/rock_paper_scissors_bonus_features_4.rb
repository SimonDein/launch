=begin
Feature Description:
Keep track of history of moves

As long as the user doesn't quit, keep track of a history of moves by both the human and computer. What data structure will you reach for? Will you use a new class, or an existing class? What will the display output look like?
=end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissor', 'lizard', 'spock']
  WINNING_CONDITIONS = {
    'rock' => ['scissor', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissor' => ['paper', 'lizard'],
    'spock' => ['scissor', 'rock'],
    'lizard' => ['paper', 'spock']
  }

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def ==(other_move)
    @value == other_move.value
  end

  def >(other_move)
    WINNING_CONDITIONS[@value].include?(other_move.value)
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    @score = 0
    @move_history = []
  end

  def choose(input)
    self.move = Move.new(input)
    self.move_history << self.move.value
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "Enter your name:"
      n = gets.chomp.capitalize
      break unless n.empty?
    end
    self.name = n
  end

  def choose
    input = nil
    loop do
      puts "Pick a move: Rock, Paper, Scissor, Lizard or Spock"
      input = gets.chomp.downcase
      break if Move::VALUES.include?(input)
      puts "Sorry '#{input}' is not a valid choice"
    end
    super(input) #Sets move and adds it to hisotry in "Player"
  end
end

class Computer < Player
  def set_name
    n = ['R2D2', 'Chappie', 'C3PO', 'iRobot'].sample
    self.name = n
  end

  def choose
    super(Move::VALUES.sample) #Sets move and adds it to hisotry in "Player"
  end
end

# Game Orchestration Engine
class RPSGame
  POINTS_TO_WIN = 10
  
  attr_accessor :human, :computer, :round_winner

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round_winner = nil
  end

  def play # ----------------- Start: Game Engine --------------------
    clear_screen
    display_welcome_message

    loop do
      loop do
        gameplay # "in game" gamplay extracted to it's own method - see below

        break if someone_won?
      end

      display_winner
      reset_scores
      break unless play_again?
      clear_screen
    end
    display_goodbye_message
  end

  def gameplay
    human.choose
    computer.choose
    clear_screen

    display_round_overview
  end # ------------------- End: Game Engine ---------------------

  private

  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissor, Lizard, Spock #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing! See you soon!"
  end

  def determine_winner
    human_move = human.move
    computer_move = computer.move

    self.round_winner =
      if human_move == computer_move
        :tie
      elsif human_move > computer_move
        :player
      else :computer
      end
  end

  def update_score
    case round_winner
    when :player then   human.score += 1
    when :computer then computer.score += 1
    end
  end

  def longest_name_size
    hns = human.name.size
    cns = computer.name.size
    hns >= cns ? hns : cns
  end

  def display_score
    width = longest_name_size + 6

    puts "SCORE:\n" +
         "#{human.name}:".ljust(width) + "#{human.score}\n" +
         "#{computer.name}:".ljust(width) + "#{computer.score}\n "
  end

  def display_moves
    puts "#{human.name} chose: #{human.move.to_s.capitalize}\n" \
    "#{computer.name} chose: #{computer.move.to_s.capitalize}\n"
  end

  def display_round_winner
    return if someone_won?

    case round_winner
    when :player
      puts "#{human.name} won this round!"
    when :computer
      puts "#{computer.name} won this round!"
    else puts "It's a tie!"
    end
  end

  def display_round_overview
    determine_winner
    update_score
    display_score
    display_moves
    display_round_winner
  end

  def someone_won?
    human.score >= POINTS_TO_WIN || computer.score >= POINTS_TO_WIN
  end

  def display_winner
    if human.score >= POINTS_TO_WIN
      puts "You won the game!!! Well done!"
    else puts "You lost the game to the computer! Better luck next time!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "#{answer.capitalize} is not a valid choice. " \
      "Please enter 'y' or 'n'."
    end
    answer == 'y' ? true : false
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end
end

# Program
RPSGame.new.play