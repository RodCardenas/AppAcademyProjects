class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    pts = 0
    aces = []
    @cards.each do |card|
      if card.value == :ace
        aces << card
      else
        pts += card.blackjack_value
      end
    end

    pts1 = pts

    aces.each do |ace|
      if (pts + 11 > 21)
        pts1 += 1
      else
        pts1 += 11
      end
    end

    pts += aces.size

    if pts1 > 21
      pts
    elsif pts1 > pts && pts1 <= 21
      pts1
    else
      pts
    end
  end

  def busted?
    points > 21 ? true : false
  end

  def hit(deck)
    if busted?
      raise "already busted"
    else
      @cards += deck.take(1)
    end
  end

  def beats?(other_hand)
    score = self.points
    comp_score = other_hand.points
    case score <=> comp_score
    when 1
      return true unless busted?
      false
    when 0
      false
    when -1
      return false unless other_hand.busted?
      true
    end
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
