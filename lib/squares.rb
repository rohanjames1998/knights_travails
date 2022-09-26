class Square
  # A square is a single position on the chess board where knight can be placed.
  # Each square has a position and adjacent squares.

  attr_accessor :position, :adjacent_squares

  def initialize(position)
    @position = position
    @adjacent_squares = []
  end
end
