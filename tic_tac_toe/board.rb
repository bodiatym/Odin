class Board
  attr_reader :cells

  WIN_CONDITION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}\n #{cells[3]} | #{cells[4]} | #{cells[5]}\n #{cells[6]} | #{cells[7]} | #{cells[8]}"
  end


  def update_board(number, symbol)
      array_position = number.to_i - 1
      @cells[array_position] = symbol
  end

  def full?
    cells.all? { |cell| cell =~ /[^0-9]/ }
  end

  def game_over?
    WIN_CONDITION.any? do |combo|
      [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
    end
  end

  def valid_move?(number)
    array_position = number.to_i - 1
    cells[array_position].is_a? Integer
  end
end
