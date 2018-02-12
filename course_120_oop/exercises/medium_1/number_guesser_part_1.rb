class GuessingGame
  MAX_NUMBER = 100
  RESULT_OF_GUESS_MSG = {
    match: "You guessed it!",
    high: "Too high",
    low: "Too low"
  }
  WIN_OR_LOOSE = {
    match: :win,
    high: :loose,
    low: :loose
  }

  RESULT_OF_GAME_MSG = {
    win: "You won the game!",
    loose: "You have no more guesses - you lost"
  }
  
  attr_accessor :remaining_guesses, :secret_num
  
  def initialize
    @remaining_guesses = 7
    @secret_num = nil
  end

  def play
    generate_secret_num
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def generate_secret_num
    @secret_num = (1..MAX_NUMBER).to_a.sample
  end

  def play_game
    result = nil
    while remaining_guesses > 0
      guess = player_takes_guess
      result = check_guess(guess)
      puts RESULT_OF_GUESS_MSG[result]
      break if result == :match

      self.remaining_guesses -= 1
    end
    WIN_OR_LOOSE[result]
  end

  def check_guess(guess)
    case guess <=> secret_num
    when 0 then  :match
    when -1 then :low
    else         :high
    end
  end

  def player_takes_guess
    answer = nil
    loop do
      puts "You have #{remaining_guesses} guesses remaining"
      puts "Enter a number between 1 and #{MAX_NUMBER}:"
      answer = gets.chomp.to_i
      break if (1..MAX_NUMBER).include?(answer)
      puts "That's an invalid guess - try again"
    end
    answer
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MSG[result]
  end
end

GuessingGame.new.play