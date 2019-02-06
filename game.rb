class Game
  def initialize
    @board = {}
  end

  def live(x, y)
    @board[[x, y]] = true
  end

  def kill(x, y)
    @board[[x, y]] = false
  end

  def alive?(x, y)
    @board[[x, y]]
  end

  def living_neighbours(x, y)
    neighbours(x, y).select { |e| alive?(e[0], e[1]) }.size
  end

  def tick
    cells_to_kill.map { |e| kill(e[0], e[1]) }
  end

  private

  def neighbours(x, y)
    [x, x+1, x-1].product([y, y+1, y-1]).select { |n| n != [x,y] }
  end

  def cells_to_kill
    @board.keys.select { |k| living_neighbours(k[0], k[1]) != 3 }
  end
end