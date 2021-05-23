require 'rspec'
require './lib/bot'

describe Bot do
  describe 'initialize' do
    it 'is an instance of bot' do
      bot = Bot.new(4, 3)

      expect(bot).to be_a Bot
      expect(bot.x).to eq(4)
      expect(bot.y).to eq(3)
      expect(bot.coords).to eq([4, 3])
    end
  end
end
