require_relative "board"

class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess
    p "which card you want to flip? please enter the index of the card"
    pos = gets.chomp.to_i
    return pos
  end
end
