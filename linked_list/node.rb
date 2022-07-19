class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next= next_node
  end
end