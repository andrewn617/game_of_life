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

  def neighbours(x, y)
    neighbours = 0
    neighbours += 1 if alive?(x+1, y)
    neighbours += 1 if alive?(x-1, y)
    neighbours += 1 if alive?(x, y+1)
    neighbours += 1 if alive?(x, y-1)
    neighbours += 1 if alive?(x+1, y+1)
    neighbours += 1 if alive?(x+1, y-1)
    neighbours += 1 if alive?(x-1, y+1)
    neighbours += 1 if alive?(x-1, y-1)   
    neighbours
  end
end