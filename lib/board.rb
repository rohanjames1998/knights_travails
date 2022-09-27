module Board_functions

  def add_sq_to_board
    row = []
    r_index = 0
    col_index = 0
    until row.length == 8
      col = []
      until col.length == 8
        sq = Square.new
        sq.position = [r_index, col_index]
        col_index += 1
        col << sq.position
      end
      row << col
      r_index += 1
      col_index = 0
    end
    row
  end

    # This method takes a 2d array of 8x8 and adds adjacent squares for each square
    # (i.e the elements of the array).
    def add_possible_moves(board)
      board.each_with_index do |row, r_index|
        row.each_with_index do |sq, index|
          # For each square on the board we check if there is a square above it,
          # after it, below it or before it. If there is one we add that as its
          # adjacent square.
          if r_index >= 1
            sq.possible_moves << board[r_index - 1][index]
          end
          if row[index + 1]
            sq.possible_moves << row[index + 1]
          end
          if board[r_index + 1]
            sq.possible_moves << board[r_index + 1][index]
          end
          if row[index - 1]
            sq.possible_moves << row[index - 1]
          end
        end
      end
    end
  end

class Square
  # A square is a single position on the chess board where knight can be placed.
  # Each square contains information about its position and all possible moves that
  # the knight can make from it.

  attr_accessor :possible_moves, :position

  def initialize
    @possible_moves = []
  end
end

class Board
  # Our board is a 2d array of where we have 8 rows and 8 columns.
  # Each row is filled with squares that contain additional information about their
  # adjacent squares. Our board uses graph as a data structure.

  include Board_functions

  attr_reader :board

  def initialize
    @board = add_sq_to_board
    # add_possible_moves(board)
  end
end

b = Board.new
p b.board
