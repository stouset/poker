require 'poker'

class Poker::Deck
  UNOPENED = [
    Poker::Card::RANKS,
    Poker::Card::SUITS,
  ].inject(&:product).map &Poker::Card.method(:build)

  def initialize(*cards)
    self.cards = (cards.empty? ? UNOPENED : cards).shuffle
  end

  def size
    self.cards.count
  end

  def deal(count = 1)
    raise 'not enough cards in deck' if count > self.size

    self.cards.pop(count)
  end

  def shuffle!
    self.cards.shuffle!
    self
  end

  alias burn   deal
  alias length size

  protected

  attr_accessor :cards
end
