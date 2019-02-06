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

  def test_can_kill_a_cell_that_does_not_have_3_neighbours
    world = Game.new

    world.live(0, 0)
    world.live(1, 0)
    world.tick

    assert_equal false, world.alive?(0, 0)
  end

  def test_can_make_a_cell_with_2_neighbours_live

    world = Game.new

    world.live(0, 0)
    world.live(1, 0)
    world.live(1, 1)
    world.tick

    assert_equal true, world.alive?(0, 0)
  end

  def test_can_tick_multiple_cells_at_once
    world = Game.new

    world.live(0, 0)
    world.live(1, 0)
    world.live(1, 1)
    world.live(-1, 0)
    world.tick

    assert_equal true, world.alive?(0, 0)
    assert_equal false, world.alive?(-1, 0)
  end

  def test_a_cell_survives_tick_even_if_its_neighbours_die
    world = Game.new

    world.live(1, 2)
    world.live(2, 3)
    world.live(1, 4)
    world.live(3, 3)
    world.tick

    assert_equal false, world.alive?(1, 2)
    assert_equal true, world.alive?(2, 3)
  end

  def test_tick_can_bring_a_new_cell_to_life
    world = Game.new
    
    world.live(0, 0)
    world.live(0, 2)
    world.live(1, 1)
    world.tick

    assert_equal true, world.alive?(0, 1)
  end
end