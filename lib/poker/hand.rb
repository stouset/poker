require 'poker'

class Poker::Hand
  attr_reader :cards

  def initialize(*cards)
    self.cards = []
    self.receive *cards
  end

  def receive(*cards)
    self.cards = (self.cards + cards).tap do |cards|
      cards.sort_by! do |card|
        [ - card.rank_index,
          - card.suit_index, ]
      end

      cards.freeze
    end

    self
  end

  def inspect
    %{"#{self.to_s}"}
  end

  def to_s
    "[#{self.cards.join(' ')}]"
  end

  protected

  attr_writer :cards
end
