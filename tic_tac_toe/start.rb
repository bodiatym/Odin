require_relative 'game.rb'
require_relative 'board.rb'

def start
  game = Game.new
  game.play
  main_menu
end

def main_menu
  puts "\n Tic Tac toe \n 1.Start \n 2.Exit \nPress number:"
  answer = gets.chomp.downcase
  if answer == '1'
    start
  else
    puts 'Good luck!'
  end
end

main_menu
