class Worm
  attr_reader :cells

  def initialize(window, grid)
    @window = window
    @grid = grid
    cell = LiveCell.new(@window, 2, 8)
    @cells = [cell]
  end

  # worm make one step
  def step(new_direction = @cells.first.direction)
    @cells.each do |cell|
      old_direction = cell.direction
      cell.direction = new_direction
      new_direction = old_direction
    end
    @cells.each(&:step)
  end

  def add_cell
    last_cell = @cells.last
    case last_cell.direction
    when 'up'
      new_cell = LiveCell.new(@window, last_cell.row, last_cell.column + 1)
      new_cell.direction = 'up'
    when 'down'
      new_cell = LiveCell.new(@window, last_cell.row, last_cell.column - 1)
      new_cell.direction = 'down'
    when 'right'
      new_cell = LiveCell.new(@window, last_cell.row - 1, last_cell.column)
      new_cell.direction = 'right'
    when 'left'
      new_cell = LiveCell.new(@window, last_cell.row + 1, last_cell.column)
      new_cell.direction = 'left'
    end
    @cells << new_cell
    @grid.cells.push(*cells)
  end
end
