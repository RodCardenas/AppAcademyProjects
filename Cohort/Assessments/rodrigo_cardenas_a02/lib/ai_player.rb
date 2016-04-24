# Represents a computer Crazy Eights player.
class AIPlayer
  attr_reader :cards

  # Creates a new player and deals them a hand of eight cards.
  def self.deal_player_in(deck)
    AIPlayer.new(deck.take(8))
  end

  def initialize(cards)
    @cards = cards
  end

  # Returns the suit the player has the most of; this is the suit to
  # switch to if player gains control via eight.
  def favorite_suit
    suits = Hash.new(0)
    @cards.each do |card|
      suits[card.suit] += 1
    end
    suit,_ = suits.max_by { |suit, count| count}
    suit
  end

  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    raise('cannot play card outside your hand') unless @cards.include?(card)
    if card.value == :eight
      pile.play_eight(card,favorite_suit)
    else
      pile.play(card)
    end
    @cards.delete(card)
  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    @cards += deck.take(1)
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    # right_suit_cards = @cards.select { |card| card.suit == pile.current_suit }
    #
    # right_value_cards = @cards.select { |card| card.value == pile.current_value }
    #
    # eights = @cards.select { |card| card.value == :eight }
    #
    # options = right_suit_cards + right_value_cards
    #
    # if options.empty? && eights.empty?
    #   return nil
    # elsif options.empty?
    #   c = eights[0]
    #   return c if pile.valid_play?(c)
    # else
    #   the_chosen_one = options.max_by { |card| card.value }
    #
    #   return the_chosen_one if pile.valid_play?(the_chosen_one)
    # end
    options = []
    @cards.each do |card|
      options << card if pile.valid_play?(card)
    end

    if !options.empty?
      options.each do |card|
        return card if card.value != :eight
      end
      options.select { |card| card.value == :eight }[0]
    else
      nil
    end

  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again until there is a valid play.
  # If deck is empty, pass.
  def play_turn(pile, deck)
    card = nil

    begin
       card = choose_card(pile)
       if card.nil?
         draw_from(deck) unless deck.empty?
       end
    end until deck.empty? || !card.nil?

    play_card(pile,card) unless card.nil?
  end
end
