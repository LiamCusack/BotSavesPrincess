require 'rspec'
require './lib/princess'
require './lib/grid'

describe Princess do
  describe 'initialize' do
    it 'is an instance of princess' do
      grid = Grid.new(5, ["-----", "-----", "p-m--", "-----", "-----"])
      princess = Princess.new(grid)

      expect(princess).to be_a Princess
      expect(princess.x).to eq(0)
      expect(princess.y).to eq(2)
      expect(princess.coords).to eq([0, 2])
    end
  end
end
