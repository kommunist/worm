class LiveCell < Gosu::Grid::Cell
  attr_accessor :direction

  def size
    object.width
  end

  def step
    case direction
    when 'left'
      left!
    when 'right'
      right!
    when 'up'
      up!
    when 'down'
      down!
    end
  end

  private

  def object
    @object ||= Gosu::Image.new(window, 'assets/live_cell.png', true)
  end
end
