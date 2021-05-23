require_relative 'bot'
require_relative 'grid'
require_relative 'princess'

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
