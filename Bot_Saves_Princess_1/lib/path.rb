require_relative 'bot'
require_relative 'grid'
require_relative 'princess'

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
