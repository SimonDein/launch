# markers
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WHO_STARTS_SETTING = 'choose'

# patterns from which a player can win
WINNING_PATTERNS = [[1, 2, 3], [3, 6, 9], [7, 8, 9], [1, 4, 7],
                    [1, 5, 9], [3, 5, 7], [2, 5, 8], [4, 5, 6]]

def prompt(msg)
  puts "=> #{msg}"
end

# formats string telling the user which squares are empty
def joinor(arr, seperator=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr[0]
  when 2 then arr.join(" #{word} ")
  else
    "#{arr[0, (arr.length - 1)].join(seperator)} #{word} #{arr[-1]}"
  end
end

# rubocop: disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system 'clear'
  display_score(player_score, computer_score)

  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  h = {}
  (1..9).each { |num| h[num] = INITIAL_MARKER }
  h
end

# return array of keys that are empty squares
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def find_at_risk_square(pattern, brd, marker)
  if brd.values_at(*pattern).count(marker) == 2
    brd.select { |k, v| pattern.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def place_piece!(player, brd)
  case player
  when "player" then player_places_piece!(brd)
  when "computer" then computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt "Sorry that is not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # offence: computer picks winning tile if possible
  WINNING_PATTERNS.each do |pattern|
    square = find_at_risk_square(pattern, brd, COMPUTER_MARKER)
    break if square
  end

# defence: computer picks a square if the player is about to complete a winning pattern
  if !square
    WINNING_PATTERNS.each do |pattern|
      square = find_at_risk_square(pattern, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = 5 if brd[5] == ' '
  end

  # if no "risk square" was found - pick a random square
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_PATTERNS.each do |pattern|
    if brd.values_at(*pattern).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*pattern).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end

  nil
end

def display_score(player_score, computer_score)
  puts "SCORE BOARD:"
  puts "Player: #{player_score}/5"
  puts "Computer #{computer_score}/5"
end

def game_over?(player_score, computer_score)
  player_score >= 5 || computer_score >= 5
end

def display_winner(player_score)
  player_score >= 5 ? prompt("Player won the game!") : prompt("The computer won the game!")
end

def alternate_player(player)
  case player
  when "player" then "computer"
  when "computer" then "player"
  end
end

def choose_who_starts(setting)
  case setting
  when 'player' then 'player'
  when 'computer' then 'computer'
  when 'choose'
    answer = nil

    loop do
      system 'clear'
      prompt "Who starts? (Enter 'P' for player or 'C' for computer)"
      answer = gets.chomp
      break if %w[c p].include?(answer.downcase)
      prompt "Sorry that is not a valid choice - please try again."
    end
    answer == 'p' ? 'player' : 'computer'
  end
end

# -------- Main Program --------
loop do
  player_score = 0
  computer_score = 0
  starting_player = choose_who_starts(WHO_STARTS_SETTING)

  # ---------- Game play ----------
  loop do
    board = initialize_board
    current_player = starting_player

    loop do
      display_board(board, player_score, computer_score)
      place_piece!(current_player, board)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)

    # ---------- Evaluation of who won ----------
    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won this round!"

      case winner
      when 'Player' then player_score += 1
      when 'Computer' then computer_score += 1
      end
    else
      prompt "It's a tie!"
    end

    if game_over?(player_score, computer_score)
      display_winner(player_score)
      break
    end

    puts "Press any key to continue"
    k = gets.chomp
  end

  prompt "Would you like to play again? Press 'Y' to continue"
  play_again = gets.chomp.downcase
  break unless play_again == 'y'
end

prompt "Thanks for playing Tic Tac Toe - goodbye!"
