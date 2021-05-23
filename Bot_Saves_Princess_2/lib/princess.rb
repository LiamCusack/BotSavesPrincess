class Princess
  attr_reader :x, :y, :coords

  def initialize(grid)
    @x = grid.locate_princess[0]
    @y = grid.locate_princess[1]
    @coords = [@x, @y]
  end
end
