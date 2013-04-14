class Card < OpenStruct
  def to(deck)
    deck << self 
  end
end