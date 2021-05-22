class Grid
  attr_reader :size, :grid

  def initialize(size, grid)
    @size = size
    @grid = grid
  end

  def locate_princess
    corners = [[0, 0], [0, (@size - 1)], [(@size - 1), 0], [(@size - 1), (@size - 1)]]
    corners.each do |corner|
      if @grid[corner[0]][corner[1]] == "p"
        return corner
      end
    end
  end
end
