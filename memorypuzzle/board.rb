require_relative "card"

class Board
  attr_reader :size, :grid
  def initialize(size)
    @grid = []
    @size = size
  end

  def populate
    Card.shuffled_cards(@size).each {|card| @grid.push(card)}
  end

  def render
    i = 0
    while i < @grid.length
      if @grid[i].revealed == false
        print ""
      else
        print @grid[i].value
      end
      print "|"
      i += 1
    end
  end

  def reveal(guessed_pos)
    if @grid[guessed_pos].revealed == false
      @grid[guessed_pos].revealed = true
      return @grid[guessed_pos].value
    end
  end

  def won?
    return @grid.all? {|card| card.revealed == true}
  end

end
