class Queue

  attr_accessor :data

  def initialize
    @data = []
  end

  def enqueue(val)
    data << val
  end

  def dequeue
    data.shift
  end

  def read
    data.first
  end

  # This is a special method we create for enqueuing all the possible moves
  # from a square
  def enqueue_all_moves(moves)
    moves.each do |move|
      data << move.position
    end
  end
end
