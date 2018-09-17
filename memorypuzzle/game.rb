require_relative "board"
require_relative "player"
require_relative "ai_player"

class Game
  attr_reader :prev_pos, :board
  def initialize(size, player, prev_pos = nil)
    @board = Board.new(size)
    @board.populate
    @prev_pos = prev_pos
    @player = player
    # @ai = ai
  end

  def play
    until over?
      system("clear")
      render
      pos = @player.guess
      while @board.grid[pos].revealed == true
        @board.render
        p "which card you want to flip? please enter the index of the card"
        pos = gets.chomp.to_i
      end
      make_guess(pos)
    end
    render
    p "Yes you win!!"
  end

  def render
    @board.render
  end



  def make_guess(pos)
    if @prev_pos == nil
      @board.grid[pos].revealed = true
      @prev_pos = pos
    else
      if @board.grid[@prev_pos].==(@board.grid[pos])
        @board.grid[pos].revealed = true
      else
        @board.grid[@prev_pos].revealed = false
        @board.grid[pos].revealed = false
      end
      @prev_pos = nil
    end
    # sleep(1)
  end

  def over?
    return @board.won?
  end
end
