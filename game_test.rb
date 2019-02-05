require 'test/unit'
require_relative 'game'

class GameTest < Test::Unit::TestCase
  def test_can_make_a_cell_live
    world = Game.new

    world.live(0, 0)

    assert_equal world.alive?(0, 0), true
  end

  def test_can_kill_a_cell
    world = Game.new

    world.kill(0, 0)

    assert_equal world.alive?(0, 0), false
  end

  def test_can_make_two_cells_live
    world = Game.new

    world.live(0, 0)
    world.live(1, 0)

    assert_equal world.alive?(0, 0), true
    assert_equal world.alive?(1, 0), true
  end
end