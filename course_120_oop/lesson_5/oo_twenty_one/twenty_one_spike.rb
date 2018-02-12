require 'pry'

class Card
  SUITS = ['S', 'C', 'H', 'D']
  VALUES = [2, 3, 4, 5, 6, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :suit, :value

  def initialize(s, v)
    @suit = s
    @value = v
  end

  def to_s
    "#{@value}#{@suit}"
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
  attr_reader :value
  
  def initialize
    @cards = []
    @value = 0
  end

  def <<(new_cards)
    @cards += new_cards
    update_hand_value
  end

  def update_hand_value
    aces = 0
    total = 0
    
    cards.each do |card|
      val = case card.value
      when (2..10)
        card.value
      when 'J', 'Q', 'K'
        10
      else
        11
        aces += 1
      end
      total += val
    end

    while total > 21 && aces > 0
      total -= 10
      aces -= 1
    end

    @value = total
  end

  def to_s
    cards[0..-2].join(', ') + ' and ' + cards[-1].to_s
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

end

class Dealer < Participant
  attr_reader :deck
  
  def initialize
    super
    @deck = Deck.new
  end

  def to_s
    num = self.cards.length - 1
    self.cards[0].to_s + "and #{num} unkown cards"
  end
  
  def deal(num = 1)
    deck.cards.sample(num)
  end

  def busted?
    player.hand.value > Game::BUSTED_AT_VALUE
  end
end

class Game
  GAME_NAME = 'Twenty One'
  BUSTED_AT_VALUE = 21
  
  attr_reader :player, :dealer
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def display_welcome
    puts "Welcome to a game of #{GAME_NAME}!"
  end

  def display_goodbye
    puts "Thanks for playing! See you soon!"
  end

  def deal_starting_hand
    player.hand << dealer.deal(2)
    dealer.hand << dealer.deal(2)
  end

  def players_turn
    loop do
      puts "Your hand: #{player.hand}"
      puts "Dealers hand: #{dealer.hand}"
  
      answer = nil
      loop do
        puts "Would you like to (h)it or (s)tay?"
        answer = gets.strip
        break if %w(h hit s stay).include?(answer)
        puts "Sorry #{answer} is not a valid choice. Try again."
      end
    
      answer.start_with?('h') ? player.hand << dealer.deal : break
      break if player.busted?
    end
  end

  def dealers_turn
    while dealer.hand.value >= 17
      dealer.hand << dealer.deal
    end
  end
  
  def start
    display_welcome
    deal_starting_hand
    players_turn
    dealers_turn
    binding.pry
    # display_result
    # display_goodbye
  end
end

Game.new.start