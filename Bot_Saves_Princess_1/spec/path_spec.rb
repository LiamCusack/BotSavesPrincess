require 'rspec'
require './lib/bot'
require './lib/grid'
require './lib/princess'
require './lib/path'

describe Path do
  before :each do
    @grid = Grid.new(3, ["p--", "-m-", "---"])
    @bot = Bot.new(@grid)
    @princess = Princess.new(@grid)
    @path = Path.new(@bot, @grid, @princess)
  end

  describe 'initialize' do
    it 'is an instance of path' do


      expect(@path).to be_a Path

      expect(@path.bot).to eq(@bot)
      expect(@path.bot.x).to eq(1)
      expect(@path.bot.y).to eq(1)

      expect(@path.grid).to eq(@grid)
      expect(@path.grid.size).to eq(3)
      expect(@path.grid.grid).to eq(["p--", "-m-", "---"])

      expect(@path.princess).to eq(@princess)
      expect(@path.princess.x).to eq(0)
      expect(@path.princess.y).to eq(0)
    end
  end

  describe 'path to princess' do
    it 'outputs the correct moves to get to the princess' do
      expect(@path.path_to_princess).to eq("LEFT\nUP\n")
    end
  end
end
