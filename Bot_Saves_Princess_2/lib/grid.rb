class Grid
  attr_reader :size, :grid

  def initialize(size, grid)
    raise ArgumentError, "Please enter an odd number greater than 2." unless size >= 3
    raise ArgumentError, "Please enter an odd number." unless size.odd? == true

    @size = size
    @grid = grid
  end

  def locate_princess
    coords = []
    @grid.any? do |s|
      if s.include?("p")
        coords << @grid.find_index(s)
        coords << s.index('p')
      end
    end
    coords
  end
end
