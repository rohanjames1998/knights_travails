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

    # This method takes a 2d array and adds all possible moves a knight can make to each square.
    def add_possible_moves(board)
      board.each_with_index do |row, r_index|
        row.each_with_index do |sq, index|
          # For each square we first check if we can move above/below/right/left of the square.(the two steps)
          # If we can then we check once more if we can move right/left from that position.(the half steps).
            # Checking if we can move above.
            if board[r_index + 2] && board[r_index + 2][index + 1]
              sq.possible_moves << board[r_index + 2][index + 1]
            end
            if board[r_index + 2] && board[r_index + 2][index - 1] && index - 1 >= 0
              sq.possible_moves << board[r_index + 2][index - 1]
            end
            # Checking if we can move right.
            if board[r_index + 1] && board[r_index + 1][index + 2]
              sq.possible_moves << board[r_index + 1][index + 2]
            end
            # When we subtract index number we have to check if we don't accidentally check for
            # the last index as index can be negative. Hence the third statement
            if board[r_index - 1] && board[r_index - 1][index + 2] && r_index - 1 >= 0
              sq.possible_moves << board[r_index - 1][index + 2]
            end
            # Checking if we can move bottom.
            if board[r_index - 2] && board[r_index - 2][index + 1] && r_index - 2 >= 0
              sq.possible_moves << board[r_index - 2][index + 1]
            end
            # Here we have to make sure that both r_index and index are positive integers.
            if board[r_index - 2] && board[r_index - 2][index - 1] && index - 1 >= 0 && r_index - 2 >= 0
              sq.possible_moves << board[r_index - 2][index - 1]
            end
            # Checking if we can move left.
            if board[r_index + 1] && board[r_index + 1][index + 2]
              sq.possible_moves << board[r_index + 1][index + 2]
            end
            if board[r_index - 1] && board[r_index - 1][index + 2] && index - 1 >= 0 && r_index - 2 >= 0
              sq.possible_moves << board[r_index - 1][index + 2]
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
end

b = Board.new
b.board[0][0].possible_moves.each do |p|
  p p.position
end
