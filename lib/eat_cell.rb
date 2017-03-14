class EatCell < Gosu::Grid::Cell

  def size
    object.width
  end

  private

  def object
    @object ||= Gosu::Image.new(window, 'assets/live_cell.png', true)
  end
end
