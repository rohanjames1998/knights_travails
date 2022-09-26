module Board_functions

  def add_sq_to_board
    row = []
    until row.length == 8
      col = []
      until col.length == 8
        sq = Square.new
        col << sq.val
      end
      row << col
    end
    row
  end

    # This method takes a 2d array of 8x8 and adds adjacent squares for each square
    # (i.e the elements of the array).
    def add_adjacent_squares(board)
      board.each_with_index do |row, index|
        r_index = index
        row.each_with_index do |sq, index|
          # For each square on the board we check if there is a square above it,
          # after it, below it or before it. If there is one we add that as its
          # adjacent square.
          case
          when board[r_index - 1] != nil
            sq.adjacent_squares << board[r_index - 1[index]].val
          when row[i + 1] != nil
            sq.adjacent_squares << row[i + 1].val
          when board[r_index + 1] != nil
            sq.adjacent_squares << board[r_index + 1[index]].val
          when row[index - 1] != nil
            sq.adjacent_squares << row[index - 1].val
          end
        end
      end
    end
  end









class Square
  # A square is a single position on the chess board where knight can be placed.
  # Since we don't want to store anything in these squares it just has one
  # property - adjacent squares.

  attr_accessor :adjacent_squares, :val

  def initialize
    @val = 'x'
    @adjacent_squares = []
  end
end

class Board
  # Our board is a 2d array of where we have 8 rows and 8 columns.
  # Each row is filled with squares that contain additional information about their
  # adjacent squares.

  include Board_functions

  attr_reader :board

  def initialize
    @board = add_sq_to_board
    add_adjacent_squares(board)
  end
end

b = Board.new
puts b[0,0].adjacent_squares
