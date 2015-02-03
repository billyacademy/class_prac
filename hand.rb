class Hand
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
  end

  def hit(deck)
    @cards << deck.draw
  end

  def score
    sum = 0
    ace_array = []

    @cards.each do |card|
      if card.ace?
        ace_array << card
      elsif card.facecard?
        sum += 10
      else
        sum += card.value
      end
    end

    if !ace_array.empty?
      until ace_array.length == 1
        ace_array.pop
        sum += 1
      end

      ace_array.each do |ace|
        if sum <= 10
          sum += 11
        else
          sum += 1
        end
      end
    end
    sum
  end

  def bust?
    score > 21
  end

  def stay?
    score >= 16
  end
end
