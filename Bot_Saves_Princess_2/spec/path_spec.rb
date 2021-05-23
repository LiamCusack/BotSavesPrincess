require 'rspec'
require './lib/bot'
require './lib/grid'
require './lib/princess'
require './lib/path'

describe Path do
  before :each do
    @grid = Grid.new(5, ["-----", "-----", "p-m--", "-----", "-----"])
    @bot = Bot.new(2, 2)
    @princess = Princess.new(@grid)
    @path = Path.new(@bot, @grid, @princess)
  end

  describe 'initialize' do
    it 'is an instance of path' do
      expect(@path).to be_a Path

      expect(@path.bot).to eq(@bot)
      expect(@path.bot.x).to eq(2)
      expect(@path.bot.y).to eq(2)

      expect(@path.grid).to eq(@grid)
      expect(@path.grid.size).to eq(5)
      expect(@path.grid.grid).to eq(["-----", "-----", "p-m--", "-----", "-----"])

      expect(@path.princess).to eq(@princess)
      expect(@path.princess.x).to eq(2)
      expect(@path.princess.y).to eq(0)
    end
  end

  describe 'path first step' do
    it 'prints the next move that the bot will take to reach the princess' do
      expect(@path.path_first_step).to eq(["LEFT"])
    end
  end
end
