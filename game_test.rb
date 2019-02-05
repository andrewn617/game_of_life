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

    assert_equal 1, world.living_neighbours(0, 0)
    assert_equal 2, world.living_neighbours(1, 0)
  end

  def test_can_check_for_vertical_neighbours
    world = Game.new

    world.live(0, 0)
    world.live(0, 1)
    world.live(0, 2)

    assert_equal 1, world.living_neighbours(0, 0)
    assert_equal 2, world.living_neighbours(0, 1)
  end

  def test_can_check_for_diagonal_neighbours
    world = Game.new

    world.live(0, 0)
    world.live(1, 1)
    world.live(2, 2)
    world.live(0, 2)

    assert_equal 1, world.living_neighbours(0, 0)
    assert_equal 3, world.living_neighbours(1, 1)
  end

  def test_can_kill_a_cell_that_does_not_have_3_neighbours
    world = Game.new

    world.live(0, 0)
    world.live(1, 0)
    world.tick(0, 0)

    assert_equal false, world.alive?(0, 0)
  end


  def test_can_make_a_cell_with_3_neighbours_live

    world = Game.new

    world.live(0, 0)
    world.live(1, 0)
    world.live(1, 1)
    world.live(-1, 0)
    world.tick(0, 0)

    assert_equal true, world.alive?(0, 0)

  end
end