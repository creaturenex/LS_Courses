class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUIT_VALUES = { 'Spades' => 4, 'Hearts' => 3, 'Clubs' => 2, 'Diamonds' => 1 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  # this meets the further exploration criteria
  def <=>(other)
    if value == other.value
      suit_value <=> other.suit_value
    else
      value <=> other.value
    end
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def suit_value
    SUIT_VALUES[suit]
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  attr_accessor :deck

  def initialize
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw
    if @deck.empty?
      initialize
      @deck.pop
    else
      @deck.pop
    end
  end
end

class PokerHand
  attr_reader :hand

  def initialize(deck)
    @hand = []
    5.times { |_| @hand << deck.draw }
  end

  def to_s
    puts hand
  end

  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  # def count
    
  # end

  private

  def royal_flush?
    royal_flush = %w(Ace King Queen Jack) + [10]
    hand.count { |card| }
     && hand.all? { |card| card.suit}

  end

  def straight_flush?
    straight_flush = %w(Ace King Queen Jack)
  end

  def four_of_a_kind?
    four_of_a_kind = %w(Ace King Queen Jack)
  end

  def full_house?
  end

  def flush?
    hand.all? and any
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
  end
end

deck = Deck.new
my_hand = PokerHand.new(deck)
puts my_hand.count { |card| card.rank }

from my hand count the cards that match the number in the Deck::RANK

my hand count (each of the values in rank)
at least 13 counts

if any counts equals 2

my_hand.hand.each { |card_object| ard.rank count {} }

hand.hand.count { *RANKS} this has 13 different int to count

han