require_relative 'board.rb'
require_relative 'queue.rb'

def knight_travails(start, final_position)

  queue = Queue.new
  board = Board.new
  visited_squares = {}
  previous_squares = {}
  queue.enqueue(start)
  while queue.read
    current_position = queue.dequeue
    if !visited_squares[current_position]
      visited_squares[current_position] = true
      queue.enqueue_all_moves(board[current_position].possible_moves)
      previous_squares[queue.read] = current_position
    end
  end
  shortest_path = []
  current_sq = final_position
  while current_sq != start
    shortest_path << current_sq
    current_sq = previous_squares[current_sq]
  end
  shortest_path << start
  return shortest_path.reverse
end

p knight_travails([3,3],[4,3])

