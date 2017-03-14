class EatCell < Gosu::Grid::Cell

  def size
    object.width
  end

  private

  def object
    @object ||= Gosu::Image.new(window, 'assets/eat_cell.png', true)
  end
end
