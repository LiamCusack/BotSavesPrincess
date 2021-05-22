class Princess
  attr_reader :x, :y
  def initialize(grid)
    @x = grid.locate_princess[1]
    @y = grid.locate_princess[0]
  end
end
