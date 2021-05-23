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

  describe 'sadpath' do
    it 'returns an error if you try to add a number above 100' do
      expect {Grid.new(500, ["-----", "-----", "p-m--", "-----", "-----"])}.to raise_error(ArgumentError)
    end
  end
end
