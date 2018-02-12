class Move
  VALUES = ['rock', 'paper', 'scissor']

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def scissor?
    @value == 'scissor'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    rock? && other_move.scissor? ||
      paper? && other_move.rock? ||
      scissor? && other_move.paper?
  end

  def <(other_move)
    rock? && other_move.paper? ||
      paper? && other_move.scissor? ||
      scissor? && other_move.rock?
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
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
      puts "Pick a move: Rock, Paper or Scissor"
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
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing! See you soon!"
  end

  def display_winner
    human_move = human.move
    computer_move = computer.move
    human_name = human.name
    computer_name = computer.name

    puts "#{human_name} chose: #{human_move}"
    puts "#{computer_name} chose: #{computer_move}"

    if    human_move > computer_move
      puts "#{human_name} won!"
    elsif human_move < computer_move
      puts "#{computer_name} won! You lost!"
    else puts "It's a tie!"
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

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

# Program
RPSGame.new.play