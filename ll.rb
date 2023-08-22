class Node
  attr_accessor :value, :next_node

  def initialize(data)
    @value = data
    @next_node = nil
  end
end

class LinkedList
  @head 

  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    @size += 1
    node = @head
    if @head
      node = node.next_node until node.next_node.nil?
      node.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def tail
    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end

  def at(index)
    return 'Out of bound!' if index > size

    node = @head
    while index.positive?
      node = node.next_node
      index -= 1
    end
    node
  end

  def pop
    node = @head
    node = node.next_node until node.next_node == tail
    data = node.next_node.value
    node.next_node = nil
    @size -= 1
    data
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(key)
    node = @head
    ind = 0
    until node.nil?
      return ind if node.value == key
      node = node.next_node
      ind += 1
    end
    "#{key} not found"
  end

  def to_s
    node = @head
    until node.nil?
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    print ' nil '
  end

  def insert_at(value, index)
    node = @head
    until index.zero?
      node = node.next_node
      index -= 1
    end
    temp = Node.new(value)
    temp.next_node = node.next_node
    node.next_node = temp
  end

  def remove_at(index)
    node = @head
    index -= 1
    until index.zero?
      node = node.next_node
      index -= 1
    end
    node.next_node = node.next_node.next_node
  end
end
