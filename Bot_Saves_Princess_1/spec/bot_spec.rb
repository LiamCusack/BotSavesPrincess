require 'rspec'
require './lib/bot'

describe Bot do
  describe 'initialize' do
    it 'is an instance of bot' do
      grid = ["---", "---", "---"]
      bot = Bot.new(grid)

      expect(bot).to be_a Bot
    end
  end
end
