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
end