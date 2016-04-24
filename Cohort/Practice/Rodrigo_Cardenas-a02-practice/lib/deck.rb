require_relative 'card'


# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |val|
        cards <<Card.new(suit,val)
      end
    end
    @cards = cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.size
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    taken = []
    raise "not enough cards" if @cards.size < n
    n.times do |n|
      taken << @cards.shift
    end

    taken
  end

  # Returns an array of cards to the bottom of the deck.
  def return(crds)
    returned = crds.dup

    crds.length.times do |n|
      @cards.push(returned.shift)
    end

    crds
  end

  private
  attr_accessor :cards

end
