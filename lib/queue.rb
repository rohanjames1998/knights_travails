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
end
