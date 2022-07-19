require_relative 'node.rb'

class LinkedList
  attr_reader :head

  def initialize(value)
    @head = Node.new(value, nil)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def append(value)
    tail.next = Node.new(value, nil)
  end

  def pop
    current_node = @head
    while current_node.next != tail
      current_node = current_node.next
    end
    current_node.next = nil
  end

  def tail
    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node
  end

  def contains?(value)
    current_node = @head
    while current_node != nil
      return true if current_node.value == value
      current_node = current_node.next
    end
    false
  end

  def to_s
    current_node = @head
    puts "Your list:"
    while current_node.next != nil
      print("( #{current_node.value} ) -> ")
      current_node = current_node.next
    end
    puts("( #{current_node.value} ) -> nil ")
  end

  def size
    current_node = @head
    counter = 1
    while current_node.next != nil
      counter+= 1
      current_node = current_node.next
    end
    counter
  end

  def find(value)
    current_node = @head
    index = 0
    while current_node != nil
      return index if current_node.value == value
      current_node = current_node.next
      index +=1
    end
    nil
  end

  def at(index)
    current_node = @head
    index_counter = 0
    while current_node != nil
      return current_node if index_counter == index
      current_node = current_node.next
      index_counter +=1
    end
    nil
  end
end
