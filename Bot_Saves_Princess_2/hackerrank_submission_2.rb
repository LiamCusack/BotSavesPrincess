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

class Grid
  attr_reader :size, :grid

  def initialize(size, grid)
    raise ArgumentError, "Please enter an integer less than 100" unless size < 100

    @size = size
    @grid = grid
  end

  def locate_princess
    coords = []
    @grid.any? do |s|
      if s.include?("p")
        coords << @grid.find_index(s)
        coords << s.index('p')
      end
    end
    coords
  end
end

class Princess
  attr_reader :x, :y, :coords

  def initialize(grid)
    @x = grid.locate_princess[0]
    @y = grid.locate_princess[1]
    @coords = [@x, @y]
  end
end

class Path
  attr_reader :bot, :grid, :princess

  def initialize(bot, grid, princess)
    @bot = bot
    @grid = grid
    @princess = princess
    @output_moves = []
  end

  def path_first_step
    self.movement if @bot.coords != @princess.coords
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
      @output_moves << "UP"
    elsif @bot.x < @princess.x
      @bot.x += 1
      @output_moves << "DOWN"
    elsif @bot.y < @princess.y
      @bot.y += 1
      @output_moves << "RIGHT"
    elsif @bot.y > @princess.y
      @bot.y -= 1
      @output_moves << "LEFT"
    end
  end
end

def nextMove(n,r,c,grid)
  my_grid = Grid.new(n, grid)
  bot = Bot.new(r, c)
  princess = Princess.new(my_grid)
  path = Path.new(bot, my_grid, princess)

  path.path_first_step
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
