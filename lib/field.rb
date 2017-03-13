require 'gosu/all'
require_relative 'dead_cell'
require_relative 'live_cell'
require_relative 'worm'


class Field < Gosu::Window
  attr_reader :grid

  TIMEOUT = 0.5

  def initialize
    super(540, 325, false)

    self.caption = "Gosu Grid"

    @grid = Gosu::Grid.new(self)
    @grid.default_cell = DeadCell.new(self, 0, 0)

    @worm = Worm.new(self, @grid, LiveCell.new(self, 2, 8))

    @grid.cells.push(*@worm.cells)
  end

  def needs_cursor?
    true
  end

  def update
    @direction =
      case
      when button_down?(Gosu::KbLeft)
        'left'
      when button_down?(Gosu::KbDown)
        'down'
      when button_down?(Gosu::KbUp)
        'up'
      when button_down?(Gosu::KbRight)
        @worm.add_cell
        'right'
      else
        @direction
      end
    @worm.step(@direction)
  end

  def draw
    @grid.draw && sleep(0.05)
  end
end
