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
    neighbours(x, y).select { |n| alive?(n[0], n[1])}.size
  end

  def tick(x, y)
    return kill(x, y) unless living_neighbours(x, y) == 3

    live(x, y)
  end

  private

  def neighbours(x, y)
    neighbours = [x, x+1, x-1].product([y, y+1, y-1])
    neighbours.delete([x, y])
    neighbours
  end
end