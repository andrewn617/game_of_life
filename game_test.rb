require 'test/unit'
require_relative 'game'

class GameTest < Test::Unit::TestCase
  def test_can_make_a_cell_live
    cell = Game.new
    
    cell.live(0, 0)

    assert_equal cell.alive?(0, 0), true
  end
end