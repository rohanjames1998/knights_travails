module Board_functions

  def add_sq_to_board
    row = []
    until row.length == 8
      col = []
      until col.length == 8
        sq = Square.new
        col << sq
      end
      row << col
    end

    # This method takes a 2d array of 8x8 and adds adjacent squares for each square
    # (i.e the elements of the array).
    # def add_adjacent_squares(board)










class Square
  # A square is a single position on the chess board where knight can be placed.
  # Since we don't want to store anything in these squares it just has one
  # property - adjacent squares.

  attr_accessor :adjacent_squares

  def initialize
    @adjacent_squares = []
  end
end

class Board
  # Our board is a 2d array of where we have 8 rows and 8 columns.
  # Each row is filled with squares that contain additional information about their
  # adjacent squares.

  include Board_functions

  def initialize
    @board = add_squares_to_board
    add_adjacent_squares(board)
  end
end
