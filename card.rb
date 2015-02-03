class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def facecard?
    facecards = ['J', 'Q', 'K']
      facecards.include?(@value)
  end

  def ace?
    value == "A"
  end

  def ranks
    if ace?
      11
    elsif facecard?
      10
    else
      value.to_i
    end
  end
end
