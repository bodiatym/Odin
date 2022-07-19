require_relative 'game.rb'

def main_menu
  puts "Hangman\n1)New game \n2)Load save\nPut number to choose:"
  answer = gets.chomp
  if answer == '1'
    start_new
  elsif answer == '2'
    start_saved
  else
    puts 'Good luck!'
  end
end

def start_new
  game = Game.new
  game.play_game
  main_menu
end

def start_saved
  game = Game.new
  game.load_game
  main_menu
end

main_menu