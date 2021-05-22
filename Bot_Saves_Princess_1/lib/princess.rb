class Princess
  attr_reader :x, :y, :coords
  
  def initialize(grid)
    @x = grid.locate_princess[1]
    @y = grid.locate_princess[0]
    @coords = [@x, @y]
  end
end
