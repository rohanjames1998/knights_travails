require_relative 'board.rb'
require_relative 'queue.rb'

def knight_travails(start, final_position)
  board = Board.new
  all_paths = {}

  board[start].possible_moves.each do |move|
    sq = move.position
  queue = Queue.new
  visited_squares = {}
  previous_squares = {}
  previous_squares[start] = sq
  queue.enqueue(sq)
  while queue.read
    current_position = queue.dequeue
    if !visited_squares[current_position]
      visited_squares[current_position] = true
      queue.enqueue_all_moves(board[current_position].possible_moves)
      if board[current_position].possible_moves.include?(board[final_position])
        previous_squares[final_position] = current_position
        if previous_squares.length > 0 && previous_squares.length < all_paths.length
          all_paths = previous_squares
          previous_squares = {}
        elsif all_paths.length == 0
          all_paths = previous_squares
          previous_squares = {}
        end
        break
      end
      previous_squares[queue.read] = current_position
    end
  end
end
pp all_paths
# shortest_path = []
  # current_sq = final_position
  # while current_sq != start
  #   shortest_path << current_sq
  #   current_sq = previous_squares[current_sq]
  # end
  # shortest_path << start
  # return shortest_path.reverse
end

knight_travails([3,3],[4,3])

