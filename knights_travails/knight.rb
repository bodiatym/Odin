class Knight
  attr_reader :position
  attr_accessor :children, :parent

  MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]].freeze

  def initialize(position, parent = nil)
    @position = position
    @children = []
    @parent = parent
  end

  def next_moves
    next_moves = MOVES.map do |move|
      move.each_with_index.map { |n, i| n + @position[i] unless (n + @position[i]).negative? || (n + @position[i]) > 7 }
    end
    next_moves.delete_if { |move| move.include?(nil) }
  end
end
