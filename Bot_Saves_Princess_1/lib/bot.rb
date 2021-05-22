class Bot
  attr_accessor :x, :y
  def initialize(grid)
    @x = (grid.size - 1) / 2
    @y = (grid.size - 1) / 2
  end
end
