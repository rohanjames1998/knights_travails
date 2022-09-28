class Queue

  attr_accessor :data

  def initialize
    @data = []
  end

  def enqueue(val)
    data << val
  end

  def dequeue
    data.unshift
  end

end
