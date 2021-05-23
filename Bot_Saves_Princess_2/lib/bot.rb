class Bot
  attr_accessor :x, :y

  def initialize(r, c)
    @x = r
    @y = c
  end

  def coords
    [@x, @y]
  end
end
