require 'rspec'
require './lib/grid'

describe Grid do
  describe 'initialize' do
    it 'is an instance of grid' do

      grid = Grid.new(3, ["p--", "-m-", "---"])

      expect(grid).to be_a Grid
    end
  end
end
