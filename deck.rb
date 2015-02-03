class Deck
  SUITS = ["Spades", "Clubs", "Hearts", "Diamonds"]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  attr_reader :deck

  def initialize
    @deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck << Card.new(suit, value)
      end
    end
    @deck.shuffle!
  end

  def draw
    @deck.pop
  end
end
