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
    @path = Path.new(@bot, @princess)
  end

  describe 'initialize' do
    it 'is an instance of path' do
      expect(@path).to be_a Path

      expect(@path.bot).to eq(@bot)
      expect(@path.bot.x).to eq(2)
      expect(@path.bot.y).to eq(2)

      expect(@path.princess).to eq(@princess)
      expect(@path.princess.x).to eq(2)
      expect(@path.princess.y).to eq(0)
    end
  end

  describe 'path next step' do
    it 'prints the next move that the bot will take to reach the princess' do
      expect(@path.path_next_step).to eq(["LEFT"])
    end
  end

  describe 'movement' do
    it 'correctly updates bot coordinates to bring bot closer to princess' do
      expect(@bot.coords).to eq([2, 2])

      @path.movement

      expect(@bot.coords).to eq([2, 1])
    end
  end

  describe 'output' do
    it 'prints the current output_moves' do
      expect(@path.output).to eq([])

      @path.path_next_step

      expect(@path.output).to eq(["LEFT"])
    end
  end
end
