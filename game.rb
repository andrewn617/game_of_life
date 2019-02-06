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

  def tick
    cells_to_tick = [cells_to_kill, cells_to_live, cells_to_keep_alive]

    cells_to_tick[0].map { |c| kill(c[0], c[1]) }
    cells_to_tick[1].map { |c| live(c[0], c[1]) }
    cells_to_tick[2].map { |c| live(c[0], c[1]) }
  end

  private

  def neighbours(x, y)
    [x, x+1, x-1].product([y, y+1, y-1]).reject { |n| n == [x,y] }
  end

  def cells_to_kill
    @board.keys.select { |k| living_neighbours(k[0], k[1]) != 3 }
  end

  def cells_to_live
    all_living_cells
      .map { |c| neighbours(c[0], c[1]) }
      .flatten
      .uniq
      .select { |c| living_neighbours(c[0], c[1]) == 3 && !alive?(c[0], c[1])}
  end

  def cells_to_keep_alive
    all_living_cells.select { |c| living_neighbours(c[0], c[1]) == 2 }
  end

  def living_neighbours(x, y)
    neighbours(x, y).select { |n| alive?(n[0], n[1]) }.size
  end

  def all_living_cells
    @board.keys.select { |k| alive?(k[0], k[1]) }
  end
end