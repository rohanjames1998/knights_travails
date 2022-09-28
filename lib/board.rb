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
        col << sq
      end
      row << col
      r_index += 1
      col_index = 0
    end
    row
  end

  def valid_position?(board[row_index][col_index])
    if row_index >=0 && col_index >=0
      if board[row_index]
        if board[row_index][col_index]
          return true
        end
      end
    end
    return false
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
  end
end


