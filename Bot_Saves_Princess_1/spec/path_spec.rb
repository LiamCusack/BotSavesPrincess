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
    @path = Path.new(@bot, @princess)
  end

  describe 'initialize' do
    it 'is an instance of path' do


      expect(@path).to be_a Path

      expect(@path.bot).to eq(@bot)
      expect(@path.bot.x).to eq(1)
      expect(@path.bot.y).to eq(1)

      expect(@path.princess).to eq(@princess)
      expect(@path.princess.x).to eq(0)
      expect(@path.princess.y).to eq(0)
    end
  end

  describe 'path to princess' do
    it 'outputs the correct moves to get to the princess' do
      expect(@path.path_to_princess).to eq(["LEFT", "UP"])
    end
  end

  describe 'movement' do
    it 'correctly updates bot coordinates to bring bot closer to princess' do
      expect(@bot.updated_coords).to eq([1, 1])

      @path.movement

      expect(@bot.updated_coords).to eq([0, 1])
    end
  end

  describe 'output' do
    it 'prints the current output_moves' do
      expect(@path.output).to eq([])

      @path.path_to_princess

      expect(@path.output).to eq(["LEFT", "UP"])
    end
  end
end
