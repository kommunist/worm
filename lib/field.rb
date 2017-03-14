require 'gosu/all'
require_relative 'dead_cell'
require_relative 'live_cell'
require_relative 'eat_cell'
require_relative 'worm'


class Field < Gosu::Window
  attr_reader :grid

  TIMEOUT = 0.5

  def initialize
    super(540, 325, false)

    self.caption = "Worm"

    @grid = Gosu::Grid.new(self)
    @grid.default_cell = DeadCell.new(self, 0, 0)

    @worm = Worm.new(self, @grid)

    @grid.cells.push(*@worm.cells)
    @direction = 'right'
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
        'right'
      else
        @direction
      end
    @eat = nil if @worm.step(@direction, eat)
  end

  def draw
    @grid.draw && sleep(0.05)
  end

  private

  def eat
    @eat ||= EatCell.new(self, rand(0..10), rand(0..10))
    @grid.cells.push(@eat)
    @eat
  end
end
