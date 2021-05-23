class Bot
  attr_accessor :x, :y

  def initialize(grid)
    @x = (grid.size - 1) / 2
    @y = (grid.size - 1) / 2
  end

  def updated_coords
    [@x, @y]
  end
end

class Grid
  attr_reader :size, :grid

  def initialize(size, grid)
    raise ArgumentError, "Please enter an odd number greater than 2." unless size >= 3
    raise ArgumentError, "Please enter an odd number." unless size.odd? == true

    @size = size
    @grid = grid
  end

  def locate_princess
    corners = [[0, 0], [0, (@size - 1)], [(@size - 1), 0], [(@size - 1), (@size - 1)]]
    corners.each do |corner|
    return corner if @grid[corner[0]][corner[1]] == "p"
    end
  end
end

class Princess
  attr_reader :x, :y, :coords

  def initialize(grid)
    @x = grid.locate_princess[1]
    @y = grid.locate_princess[0]
    @coords = [@x, @y]
  end
end

class Path
  attr_reader :bot, :princess

  def initialize(bot, princess)
    @bot = bot
    @princess = princess
    @output_moves = []
  end

  def path_to_princess
    self.movement until @bot.updated_coords == @princess.coords
    self.output
  end

  def output
    @output_moves.each do |move|
      puts move
    end
  end

  def movement
    if @bot.x > @princess.x
      @bot.x -= 1
      @output_moves << "LEFT"
    elsif @bot.x < @princess.x
      @bot.x += 1
      @output_moves << "RIGHT"
    elsif @bot.y < @princess.y
      @bot.y += 1
      @output_moves << "DOWN"
    elsif @bot.y > @princess.y
      @bot.y -= 1
      @output_moves << "UP"
    end
  end
end

def displayPathtoPrincess(n,grid)
  my_grid = Grid.new(n, grid)
  bot = Bot.new(my_grid)
  princess = Princess.new(my_grid)
  path = Path.new(bot, princess)

  path.path_to_princess
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
