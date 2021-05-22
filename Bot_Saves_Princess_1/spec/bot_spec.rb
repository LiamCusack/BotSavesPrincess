require 'rspec'
require './lib/bot'
require './lib/grid'

describe Bot do
  describe 'initialize' do
    it 'is an instance of bot' do
      grid = Grid.new(3, ["p--", "-m-", "---"])
      bot = Bot.new(grid)

      expect(bot).to be_a Bot
      expect(bot.x).to eq(1)
      expect(bot.y).to eq(1)
    end
  end
end
