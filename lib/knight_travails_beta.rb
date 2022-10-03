require_relative 'board.rb'
require_relative 'queue.rb'


def knight_travails(start, final_position)
  board = Board.new
  prev_sqs = {}
  visited_squares = {}
  queue = Queue.new
  queue.enqueue(start)
  while queue.read
    current_position = queue.dequeue
    if !visited_squares[current_position]
      board[current_position].possible_moves.each do |move|
        if !visited_squares[move.position]
        queue.enqueue(move.position)
        prev_sqs[move.position] = current_position
        if move.position == final_position
          break
        end
      end
      end
      visited_squares[current_position] = true
    end
  end
  shortest_path = []
    current_sq = final_position
    until current_sq == start
      shortest_path << current_sq
      current_sq = prev_sqs[current_sq]
    end
    shortest_path << start
    shortest_path.reverse
end


# end

# p knight_travails([3,3],[4,3])




pp knight_travails([3,3],[4,3])



