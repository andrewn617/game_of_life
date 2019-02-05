require 'test/unit'
require_relative 'game'

class GameTest < Test::Unit::TestCase
  def test_can_make_a_cell_live
    world = Game.new

    world.live(0, 0)

    assert_equal true, world.alive?(0, 0) 
  end

  def test_can_kill_a_cell
    world = Game.new

    world.kill(0, 0)

    assert_equal false, world.alive?(0, 0)
  end

  def test_can_make_two_cells_live
    world = Game.new

    world.live(0, 0)
    world.live(1, 0)

    assert_equal true, world.alive?(0, 0)
    assert_equal true, world.alive?(1, 0)
  end 


  def test_can_check_for_horizontal_neighbours
    world = Game.new

    world.live(0, 0)
    world.live(1, 0)
    world.live(2, 0)

    assert_equal 1, world.neighbours(0, 0)
    assert_equal 2, world.neighbours(1, 0)
  end
end