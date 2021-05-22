require_relative 'bot'
require_relative 'grid'
require_relative 'princess'

class Path
  attr_reader :bot, :grid, :princess

  def initialize(bot, grid, princess)
    @bot = bot
    @grid = grid
    @princess = princess
  end
end
