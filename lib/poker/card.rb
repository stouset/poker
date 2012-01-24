# coding: utf-8

require 'poker'

class Poker::Card
  RANKS       = %w{ 2 3 4 5 6 7 8 9 T J Q K A }
  SUITS       = %w{ h d c s }
  SUIT_ICONS  = %w{ ♥ ♦ ♣ ♠ }

  attr_reader :rank
  attr_reader :suit
  attr_reader :rank_index
  attr_reader :suit_index

  def self.build(pair)
    self.new(*pair)
  end

  def self.parse(*strings)
    strings.map {|string| self.build string.split(//) }
  end

  def initialize(rank, suit)
    self.rank       = rank
    self.suit       = suit
    self.rank_index = RANKS.index(rank) or raise 'unknown rank'
    self.suit_index = SUITS.index(suit) or raise 'unknown suit'

    self.freeze
  end

  def inspect
    %{"#{self.to_s}"}
  end

  def to_s
    '%{rank}%{suit}' % {
      :rank  => self.rank,
      :suit  => SUIT_ICONS[self.suit_index],
    }
  end

  def to_a
    [ self.rank, self.suit ]
  end

  def to_hash
    { :rank => self.rank,
      :suit => self.suit, }
  end

  class << self
    alias [] parse
  end

  protected

  attr_writer :rank
  attr_writer :suit
  attr_writer :rank_index
  attr_writer :suit_index
end
