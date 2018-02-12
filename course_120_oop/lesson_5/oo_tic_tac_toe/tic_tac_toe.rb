class Board
  attr_reader :squares

  INITIAL_MARKER = " "
  WINNING_PATTERNS = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  def initialize # ----------- INIT -----------
    @squares = {}
    # sets up squares
    (1..9).each { |num| @squares[num] = Square.new(INITIAL_MARKER) }
  end

  # rubocop:disable Style/IndentArray
  def display
    b = [
    "     |     |     ",
    "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  ",
    "     |     |     ",
    "-----+-----+-----",
    "     |     |     ",
    "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  ",
    "     |     |     ",
    "-----+-----+-----",
    "     |     |     ",
    "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  ",
    "     |     |     "
    ]
    b.each { |row| puts row.center(TTTGame::WIDTH) }
  end
  # rubocop:enable Style/IndentArray

  def empty_squares
    @squares.select { |_, sq| sq.value == INITIAL_MARKER }.keys
  end

  def square_empty?(square)
    empty_squares.include?(square)
  end

  def opportunity_square(marker)
    WINNING_PATTERNS.each do |pattern|
      sqs = @squares.values_at(*pattern)
      if sqs.count { |sq| sq.value == marker } == 2
        @squares.each do |k, v|
          return k if pattern.include?(k) && v.value == INITIAL_MARKER
        end
      end
    end
    false
  end

  def middle_square_empty?
    self[5] == INITIAL_MARKER
  end

  def []=(key, marker)
    @squares[key].value = marker
  end

  def [](key)
    @squares[key].value
  end

  def full?
    empty_squares.empty?
  end

  def winner_marker
    WINNING_PATTERNS.each do |pattern|
      [TTTGame::X_MARKER, TTTGame::O_MARKER]. each do |marker|
        return marker if pattern.all( |sq| @squares[sq].value == marker)
      end
    end
    nil
  end

  def someone_won?
    !!winner_marker
  end
end

class Square
  attr_accessor :value

  def initialize(marker) # ----------- INIT -----------
    @value = marker
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :score, :marker, :name

  def initialize # ----------- INIT -----------
    @marker = nil
    @score = 0
  end
end

class Human < Player
end

class Computer < Player
  NAMES = ['C3PO', 'R2D2', 'Deep Blue']

  def initialize
    super
    @name = NAMES.sample
  end
end

class TTTGame
  TITLE = 'Tic-Tac-Toe'
  O_MARKER = 'O'
  X_MARKER = 'X'
  WIDTH = 40

  attr_accessor :board, :points_to_win
  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @board = Board.new
    @points_to_win = nil
    @first_to_move = nil
    @current_marker = nil
  end

  # orchastrates the whole game flow
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def play
    display_welcome

    loop do
      set_marker_points_to_win_and_who_starts

      loop do
        loop do
          display_board_overview
          current_player_moves
          break if board.someone_won? || board.full?
        end

        update_score
        display_board_overview
        break if game_winner?

        display_round_result
        break unless play_again?("keep playing")
        board_reset
      end

      display_game_winner
      break unless play_again?("play a new game")
      board_and_score_reset
    end
    display_goodbye_msg
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  def clear_screen
    system('clear') || system('cls')
  end

  def insert_spacing(rows)
    rows.times { puts '' }
  end

  def joinor(arr)
    case arr.length
    when 1 then arr[0]
    when 2 then "#{arr[0]} or #{arr[1]}"
    else "#{arr[0..-2].join(', ')} or #{arr[-1]}"
    end
  end

  def press_to_continue
    puts "Press to continue..."
    gets
  end

  def display_welcome # -------- Welcome --------
    clear_screen
    choose_name
    clear_screen
    display_welcome_msg
  end

  def choose_name
    puts "Choose a player name:"
    n = nil
    loop do
      n = gets.strip
      break unless n.empty? && n.lengt < 0
      puts "Please enter a player name"
    end
    n = n.split.map(&:capitalize).join(' ')
    human.name = n
  end

  def display_welcome_msg
    puts "display_Welcome to a game of #{TITLE} #{human.name}!"
    insert_spacing(3)
  end

  def set_marker_points_to_win_and_who_starts # -------- SETUP --------
    clear_screen
    choose_marker
    clear_screen
    choose_points_to_win
    clear_screen
    choose_who_starts
  end

  def choose_marker
    puts "Would you like to play 'X' or 'O'? (enter a value)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['o', 'x'].include?(answer)
      puts "Please enter either 'X' or 'O' (the letter)"
    end

    case answer
    when 'x'
      human.marker = X_MARKER
      computer.marker = O_MARKER
    when 'o'
      human.marker = O_MARKER
      computer.marker = X_MARKER
    end
  end

  def choose_points_to_win
    puts "How many points do you want to play to?"
    n = nil
    loop do
      n = gets.chomp.to_i
      break if (1..15).cover?(n)
      puts "You have to play to at least one point" if n < 1
      puts "#{n} points is a little much - choose a lower number" if n > 15
    end
    @points_to_win = n
  end

  def choose_who_starts
    puts "Would you like to start?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['yes', 'no'].include?(answer)
      puts "Sorry, that's not valid. Please enter 'yes' or 'no'"
    end
    @first_to_move = answer == 'yes' ? human.marker : computer.marker
    @current_marker = @first_to_move
  end

  def display_board_overview # -------- DISPLAY BOARD OVERVIEW --------
    clear_screen
    display_title
    display_scoreboard
    board.display
  end

  def display_title
    puts "<<<|| #{TITLE.upcase} ||>>>".center(WIDTH)
    insert_spacing(3)
  end

  # rubocop:disable Metrics/LineLength
  def display_scoreboard
    human_name = human.name << ':'
    computer_name = computer.name << ':'
    puts "------- SCOREBOARD -------".center(WIDTH)
    puts "#{(human_name).ljust(20)}  #{human.score}/#{points_to_win}".center(WIDTH)
    puts "#{(computer_name).ljust(20)}  #{computer.score}/#{points_to_win}".center(WIDTH)
    puts "--------------------------".center(WIDTH)
    insert_spacing(1)
  end
  # rubocop:enable Metrics/LineLength

  def current_player_moves # -------- CURRENT PLAYER MOVES --------
    if @current_marker == human.marker
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    puts "Choose a square: #{joinor(board.empty_squares)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.square_empty?(square)
      puts "Sorry that's an invalid move. Try again"
    end
    board[square] = human.marker
  end

  def computer_moves
    square = if computer_can_win?
               board.opportunity_square(computer.marker)
             elsif player_can_win?
               board.opportunity_square(human.marker)
             elsif board.middle_square_empty?
               5
             else
               @board.empty_squares.sample
             end

    board[square] = computer.marker
  end

  def computer_can_win?
    !!board.opportunity_square(computer.marker)
  end

  def player_can_win?
    !!board.opportunity_square(human.marker)
  end

  def update_score
    case round_winner
    when "player" then human.score += 1
    when "computer" then computer.score += 1
    end
  end

  def round_winner
    if board.winner_marker == human.marker then 'player'
    elsif board.winner_marker == computer.marker then 'computer'
    end
  end

  def display_round_result
    case round_winner
    when 'player'
      puts "You won this round!"
    when 'computer'
      puts "The computer won this round!"
    else puts "The board is full - it's a tie!"
    end
  end

  def game_winner?
    !!game_winner
  end

  def game_winner
    if human.score >= points_to_win
      'player'
    elsif computer.score >= points_to_win
      'computer'
    end
  end

  def display_game_winner
    return if game_winner.nil?

    msg = case game_winner
          when 'player'
            "You have won the game!!!"
          when 'computer'
            "You lost to the computer! Better luck next time!"
          end

    puts ">>> #{msg} <<<".center(WIDTH)
  end

  def board_reset
    self.board = Board.new
    @current_marker = @first_to_move
  end

  def board_and_score_reset
    self.board = Board.new
    human.score = 0
    computer.score = 0
  end

  def play_again?(msg)
    puts "Would you like to #{msg}? (y / n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if answer.start_with?('y', 'n')
      puts "Please enter yes or no"
    end
    answer.start_with?('y') ? true : false
  end

  def display_goodbye_msg
    puts "Thanks for playing - see you soon!"
  end
end

game = TTTGame.new
game.play
