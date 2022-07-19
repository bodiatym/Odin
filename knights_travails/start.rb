require_relative 'board'

game = Board.new

game.knight_moves([0, 0], [3, 3])
puts ''

game.knight_moves([3, 3], [0, 0])
puts ''

game.knight_moves([3, 3], [4, 3])
puts ''
