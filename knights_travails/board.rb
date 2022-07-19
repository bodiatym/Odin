require_relative 'knight'

class Board
  def knight_moves(start, destination)
    current = make_tree(start, destination)
    history = []
    make_history(current, history, start)
    print_knight_moves(history, start, destination)
  end

  private

  def make_tree(start, destination)
    queue = [Knight.new(start)]
    current = queue.shift
    until current.position == destination
      current.next_moves.each do |move|
        current.children << knight = Knight.new(move, current)
        queue << knight
      end
      current = queue.shift
    end
    current
  end

  def make_history(current, history, start)
    until current.position == start
      history << current.position
      current = current.parent
    end
    history << current.position
  end

  def print_knight_moves(history, start, destination)
    puts "You made it in #{history.size - 1} moves!"
    puts "To get from #{start} to #{destination} you must traverse the following path:"
    history.reverse.each { |move| puts move.to_s }
  end
end
