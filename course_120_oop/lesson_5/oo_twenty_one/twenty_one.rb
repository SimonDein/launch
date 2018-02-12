module Utilities
  def clear_screen
    system('clear') || system('cls')
  end

  def insert_spacing(rows)
    rows.times { puts '' }
  end

  def press_to_continue
    gets
  end

  def press_enter_to_continue
    puts "Press enter to continue..."
    gets
  end
end

class Card
  SUITS = ['S', 'C', 'H', 'D']
  VALUES = [2, 3, 4, 5, 6, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :suit, :face, :value

  def initialize(s, f)
    @suit = s
    @face = f
    @value = detect_value(f)
  end

  def detect_value(face)
    case face
    when (2..10)
      face
    when 'J', 'Q', 'K'
      10
    else
      11
    end
  end

  def to_s
    "#{@face}#{@suit}"
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
    @cards.shuffle!
  end
end

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
    @value = 0
  end

  def value(options = { reveal: true })
    case options[:reveal]
    when true
      @value
    when false
      "#{@cards[0].value} < ?"
    end
  end

  def <<(new_cards)
    @cards += new_cards
    update_hand_value
  end

  def update_hand_value
    aces = 0
    total = 0

    cards.each do |card|
      total += card.value
      aces += 1 if card.value == 11
    end

    while total > 21 && aces > 0
      total -= 10
      aces -= 1
    end

    @value = total
  end

  def to_s(options = { reveal: true })
    case options[:reveal]
    when true
      @cards[0..-2].join(', ') + ' and ' + cards[-1].to_s
    when false
      @cards[0].to_s + " and an unkown card"
    end
  end
end

class Participant
  include Utilities
  
  attr_reader :hand

  def initialize
    @hand = Hand.new
  end

  def busted?
    @hand.value > 21
  end
end

class Player < Participant
  def display_hand
    puts "Your cards:".ljust(Game::L_SPACING) +
         @hand.to_s.rjust(Game::R_SPACING)
    puts "Hand value:".ljust(Game::L_SPACING) +
         @hand.value.to_s.rjust(Game::R_SPACING)
    insert_spacing(1)
  end
end

class Dealer < Participant
  attr_accessor :deck

  def initialize
    super
    @deck = Deck.new
  end

  def deal(num = 1)
    deck.cards.pop(num)
  end

  def display_hand(options)
    puts "Dealers cards:".ljust(Game::L_SPACING) +
         @hand.to_s(options).rjust(Game::R_SPACING)

    puts "Hand value:".ljust(Game::L_SPACING) +
         @hand.value(options).to_s.rjust(Game::R_SPACING)
    insert_spacing(1)
  end

  def busted?
    @hand.value > Game::BUSTED_AT_VALUE
  end
end

class Scoreboard
  include Utilities

  SPACING = 21

  attr_writer :player, :dealer

  def initialize(ptw)
    @points_to_win = ptw
    @player = 0
    @dealer = 0
  end

  def detect_winner
    if @player == @points_to_win then :player
    elsif @dealer == @points_to_win then :dealer
    end
  end

  def someone_won?
    !!detect_winner
  end

  def update_score(result)
    case result
    when :dealer_busted, :player_won
      @player += 1
    when :player_busted, :dealer_won
      @dealer += 1
    end
  end

  def reset
    @player = 0
    @dealer = 0
  end

  def display
    lines = ["------- SCOREBOARD -------",
             "Player:".ljust(SPACING) + "#{@player}/#{@points_to_win}",
             "Dealer:".ljust(SPACING) + "#{@dealer}/#{@points_to_win}",
             "--------------------------"]

    lines.each { |line| puts line.center(Game::WIDTH) }
    insert_spacing(2)
  end
end

class Game
  include Utilities

  GAME_NAME = 'Twenty One'
  BUSTED_AT_VALUE = 21
  L_SPACING = 14
  R_SPACING = 26
  WIDTH = 50

  attr_reader :player, :dealer, :scoreboard

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @scoreboard = nil # Scoreboard is generated in get_points_to_win
  end

  def start
    display_intro
    loop do
      get_points_to_win
      loop do
        deal_starting_hand
        players_turn
        dealers_turn
        display_result_and_update_score
        break if scoreboard.someone_won?
        reset_hands_and_deck
      end
      display_game_winner
      break unless play_again?
      reset_hands_and_deck
      reset_scores
    end
    display_goodbye
  end

  private

  def display_intro
    display_welcome
    insert_spacing(2)
    display_rules
  end

  def display_welcome
    clear_screen
    puts "Welcome to a game of #{GAME_NAME}!"
    press_to_continue
  end

  def display_rules
    rules = ['RULES',
             '- Twenty One is a card game',
             '- Each game consist of a dealer and a player (you)',
             '- Both the dealer and you will start with two cards',
             '- You will be able to see your cards at all times - but only one of the dealers cards',
             "- You can either 'hit' (get another card) or 'stay' (pass the turn to the dealer)",
             "- The goal is to get a higher 'hand value' than the dealer without 'busting'",
             "- You bust if your 'hand value' surpasses 21",
             "",
             "- Cards 2-10 are worth their face value",
             "- Cards Jack, Queen and King are worth 10",
             "- Aces are worth either 1 or 11 (recalibrating as you go along)",
             ""]
    clear_screen
    rules.each { |line| puts line }
    press_enter_to_continue
  end

  def get_points_to_win
    clear_screen

    points_to_win = nil
    loop do
      puts "How many points do you want to play to?"
      points_to_win = gets.strip.to_i
      break if points_to_win > 0
    end
    @scoreboard = Scoreboard.new(points_to_win)
  end

  def deal_starting_hand
    player.hand << dealer.deal(2)
    dealer.hand << dealer.deal(2)
  end

  def players_turn
    loop do
      display_overview(reveal: false)

      answer = nil
      loop do
        puts "Would you like to (h)it or (s)tay?"
        answer = gets.strip.downcase
        break if %w[h hit s stay].include?(answer)
        puts "Sorry #{answer} is not a valid choice. Try again."
      end

      answer.start_with?('h') ? player.hand << dealer.deal : break
      break if player.busted?
    end
  end

  def display_overview(options = { reveal: false })
    clear_screen
    display_title
    scoreboard.display
    dealer.display_hand(options)
    player.display_hand
    insert_spacing(2)
  end

  def display_title
    puts "<<<|| #{GAME_NAME.upcase} ||>>>".center(WIDTH)
    insert_spacing(1)
  end

  def dealers_turn
    while dealer.hand.value < 17
      dealer.hand << dealer.deal
    end
  end

  def display_result_and_update_score
    result = detect_result
    scoreboard.update_score(result)

    display_overview(reveal: true)

    msg = get_message(result)
    puts msg.center(WIDTH)
    press_to_continue unless scoreboard.someone_won?
  end

  def detect_result
    if player.busted?
      :player_busted
    elsif dealer.busted?
      :dealer_busted
    elsif player.hand.value > dealer.hand.value
      :player_won
    elsif player.hand.value < dealer.hand.value
      :dealer_won
    else
      :tie
    end
  end

  def get_message(status)
    case status
    when :player_busted
      "You busted!"
    when :dealer_busted
      "The dealer busted!"
    when :player_won
      "You won on highest hand!"
    when :dealer_won
      "The dealer got a better hand than you"
    else
      "It's a tie"
    end
  end

  def reset_hands_and_deck
    dealer.deck = Deck.new
    dealer.hand.cards.clear
    player.hand.cards.clear
  end

  def play_again?
    clear_screen

    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.strip.downcase
      break if %w[y yes n no].include?(answer)
      puts "Please type (y)es or (n)o and hit enter"
    end
    answer.start_with?('y') ? true : false
  end

  def game_over?
    scoreboard.game_over?
  end

  def reset_scores
    scoreboard.reset
  end

  def display_game_winner
    winner = scoreboard.detect_winner
    msg = case winner
          when :player
            " You won the game!! "
          when :dealer
            " You lost! "
          end

    puts msg.center(WIDTH, '|')
    press_enter_to_continue
  end

  def display_goodbye
    clear_screen
    puts "Okay - thanks for playing! See you soon!"
  end
end

Game.new.start
