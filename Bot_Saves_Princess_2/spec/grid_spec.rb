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

  describe 'sadpath' do
    it 'raises an error if size is less than 3' do
      expect {Grid.new(2, ["p--", "-m-", "---"])}.to raise_error(ArgumentError)
    end

    it 'raises an error if the size is an even number' do
      expect {Grid.new(4, ["p--", "-m-", "---"])}.to raise_error(ArgumentError)
    end
  end
end
