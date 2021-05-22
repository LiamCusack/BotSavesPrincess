require_relative 'bot'
require_relative 'grid'
require_relative 'princess'

class Path
  attr_reader :bot, :grid, :princess

  def initialize(bot, grid, princess)
    @bot = bot
    @grid = grid
    @princess = princess
    @output_moves = ""
  end

  def path_to_princess
    until @bot.updated_coords == @princess.coords
      self.movement
    end
    @output_moves
  end

  def movement
    if @bot.x > @princess.x
      @bot.x -= 1
      @output_moves.concat("LEFT\n")
    elsif @bot.x < @princess.x
      @bot.x += 1
      @output_moves.concat("RIGHT\n")
    elsif @bot.y < @princess.y
      @bot.y += 1
      @output_moves.concat("DOWN\n")
    elsif @bot.y > @princess.y
      @bot.y -= 1
      @output_moves.concat("UP\n")
    end
  end
end
