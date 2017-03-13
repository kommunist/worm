class Worm
  attr_reader :cells

  def initialize(window, grid, cell)
    @window = window
    @grid = grid
    cell.direction = 'right'
    @cells = [cell]
  end

  # worm make one step
  def step(new_direction)
    @cells.each do |cell|
      old_direction = cell.direction
      cell.direction = new_direction
      new_direction = old_direction
    end
    @cells.each(&:step)
  end

  def add_cell
    last_cell = @cells.last
    
    @cells << LiveCell.new(@window, last_cell.row+1, last_cell.column+1)
    @grid.cells.push(*cells)
  end
end
