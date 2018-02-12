class Card
  include Comparable
  RANK_TO_VALUE = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit # plays no role in determining high or low
  end

  def <=>(other)
    value(rank) <=> value(other.rank)
  end

  def value(ranking)
    case ranking
    when (2..10) then ranking
    else RANK_TO_VALUE[ranking]
    end
  end

  def to_s()
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards
  
  def initialize
    @cards = generate_new_deck
  end
  
  def draw
    self.cards = generate_new_deck if cards.empty?
    cards.pop
  end
  
  private

  attr_writer :cards

  def generate_new_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each { |rank| cards << Card.new(rank, suit)}
    end
    cards.shuffle!
  end

end


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.