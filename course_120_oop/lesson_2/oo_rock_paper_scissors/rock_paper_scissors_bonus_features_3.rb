=begin
Feature Description:
What would happen if we went even further and introduced 5 more classes, one for each move: Rock, Paper, Scissors, Lizard, and Spock. How would the code change? Can you make it work? After you're done, can you talk about whether this was a good design decision? What are the pros/cons?

- Add a class for each move
  - 

=end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissor', 'lizard', 'spock']

  def initialize(value)
    @value = case value
    when 'rock'    then Rock.new
    when 'paper'   then Paper.new
    when 'scissor' then Scissor.new
    when 'lizard'  then Lizard.new
    when 'spock'   then Spock.new
    end
  end

  def to_s
    @value.class
  end

  def ==(other_move)
    @value == other_move.value
  end
end

class Rock < Move
  def initialize  
  end
  
  def self.>(other_move)
    [Scissor, Lizard].include?(other_move)
  end
end
  
class Paper < Move
  def initialize
  end
  
  def self.>(other_move)
    [Rock, Spock].include?(other_move)
  end
end
  
class Scissor < Move
  def initialize
  end
  
  def self.>(other_move)
    [Paper, Lizard].include?(other_move)
  end
end
  
class Lizard < Move
  def initialize
  end
  
  def self.>(other_move)
    [Paper, Spock].include?(other_move)
  end
end
  
class Spock < Move
  def initialize
  end
  
  def self.>(other_move)
    [Scissor, Rock].include?(other_move)
  end
end
  
class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
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
    self.move = Move.new(input)
  end
end

class Computer < Player
  def set_name
    n = ['R2D2', 'Chappie', 'C3PO', 'iRobot'].sample
    self.name = n
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    puts @move
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :round_winner

  POINTS_TO_WIN = 10

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
        gameplay # "in game" gamplay extracted to it's own method

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
    puts "Welcome to a game of Rock, Paper, Scissor, Lizard, Spock #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing! See you soon!"
  end

  def determine_winner
    human_move = human.move.value.class
    computer_move = computer.move.value.class

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
    puts "#{human.name} chose: #{human.move.value.class}\n" \
    "#{computer.name} chose: #{computer.move.value.class}\n"
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
    human.score >= 10 || computer.score >= POINTS_TO_WIN
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