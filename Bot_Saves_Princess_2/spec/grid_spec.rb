require 'rspec'
require './lib/grid'

describe Grid do
  describe 'initialize' do
    it 'is an instance of grid' do

      grid = Grid.new(5, ["-----", "-----", "p-m--", "-----", "-----"])

      expect(grid).to be_a Grid
      expect(grid.size).to eq(5)
      expect(grid.grid).to eq(["-----", "-----", "p-m--", "-----", "-----"])
      expect(grid.locate_princess).to eq([2, 0])
    end
  end
end
