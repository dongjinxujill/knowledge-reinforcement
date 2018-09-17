class AIPlayer
  def initialize
    @known_cards = {}
    @matched_cards = []
  end

  def receive_revealed_card(pos, value)
    @known_cards[value] = pos

  end

  def guess
    p "which card you want to flip? please enter the index of the card"

    pos = gets.chomp.to_i
    return pos
  end

  def receive_match(pos1, pos2)
    @matched_cards.push(pos1)
    @matched_cards.push(pos2)
  end
end
