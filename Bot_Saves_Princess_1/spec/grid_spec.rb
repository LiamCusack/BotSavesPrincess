require 'rspec'
require './lib/grid'

describe Grid do
  describe 'initialize' do
    it 'is an instance of grid' do

      grid = Grid.new(3, ["p--", "-m-", "---"])

      expect(grid).to be_a Grid
      expect(grid.size).to eq(3)
      expect(grid.grid).to eq(["p--", "-m-", "---"])
      expect(grid.locate_princess).to eq([0, 0])
    end
  end
end
