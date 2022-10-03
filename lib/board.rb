module Board_functions

  def add_sq_to_board
    # Adding squares to board along with their position.
    row = []
    r_index = 7
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
      r_index -= 1
      col_index = 0
    end
    row
  end

  def valid_position?(board, row_index, col_index)
    # Here we first check if both the index are above positive. Then we check
    # If whether row exists on the board. Finally we check if  the square exists on the
    # given row.
    if row_index >=0 && col_index >=0 && board[row_index] && board[row_index][col_index]
      return true
    end
    return false
  end

  def add_possible_moves(board)
    board.each_with_index do |row, row_index|
      row.each_with_index do |sq, col_index|
        # Adding possible top moves.
        if valid_position?(board, row_index + 2, col_index + 1)
          sq.possible_moves << board[row_index + 2][col_index + 1]
        end
        if valid_position?(board, row_index - 2, col_index - 1)
          sq.possible_moves << board[row_index - 2][col_index - 1]
        end
        # Adding possible right moves.
        if valid_position?(board, row_index + 1, col_index + 2)
          sq.possible_moves << board[row_index + 1][col_index + 2]
        end
        if valid_position?(board, row_index - 1, col_index + 2,)
          sq.possible_moves << board[row_index - 1][col_index + 2]
        end
        # Adding possible bottom moves.
        if valid_position?(board, row_index - 2, col_index + 1)
          sq.possible_moves << board[row_index - 2][col_index + 1]
        end
        if valid_position?(board, row_index + 2, col_index - 1)
          sq.possible_moves << board[row_index + 2][col_index - 1]
        end
        # Adding possible left moves.
        if valid_position?(board, row_index + 1, col_index - 2)
          sq.possible_moves << board[row_index + 1][col_index - 2]
        end
        if valid_position?(board, row_index - 1, col_index - 2)
          sq.possible_moves << board[row_index - 1][col_index - 2]
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
    add_possible_moves(board)
  end

  # This method makes accessing specific position on the board simpler.
  def [](location)
    row = 7 - location[0]
    column = location[1]
    board[row][column]
  end
end
b = Board.new
b[[4,1]].possible_moves.each do |p|
  p p.position
end


