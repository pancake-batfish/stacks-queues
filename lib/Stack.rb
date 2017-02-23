class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop
    @store.pop
  end

  def top
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

  def to_s
    return @store.to_s
  end
end
