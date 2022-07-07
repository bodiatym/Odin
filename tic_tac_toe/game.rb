class Game
  attr_reader :board
  def initialize
    @noughts = "0"
    @crosses = "X"
    @current_move = nil
    @board = Board.new
  end

  def play
    @current_move = @crosses
    until @board.full? or @board.game_over?
      @board.show
      puts "#{@current_move} move.\n Press the number to choose position:"
      number = gets.chomp
      if board.valid_move?(number)
        board.update_board(number, @current_move)
        switch_current_move
      else
        puts "Invalid move!!!!!!!!\n Do correct move"
      end
    end
    ending
  end

  private

  def ending
    puts "#{@current_move} Wins. Congratulations!!!!!!"
  end

  def switch_current_move
    @current_move = @current_move == @crosses ? @noughts : @crosses
  end
end
