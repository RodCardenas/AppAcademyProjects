require_relative 'card'

# Represents a deck of playing cards.
class Deck

  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []

    Card.suits.each do |suit|
      Card.values.each do |val|
        cards << Card.new(suit, val)
      end
    end

    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.size
  end

  def empty?
    count == 0
  end

  # Takes `n` cards from the top of the deck (front of the cards array).
  def take(n)
    raise ('not enough cards') if n > count
    @cards.shift(n)
  end

  # Returns an array of cards to the bottom of the deck (back of the cards array).
  def return(new_cards)
    new_cards.each do |card|
      @cards << card
    end
  end

  private
  attr_accessor :cards

end
