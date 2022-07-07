require_relative 'codebreaker.rb'
require_relative 'codemaker.rb'

def start_codebreaker
  game = Codebreaker.new
  game.play
  main_menu
end

def start_codemaker
  game = Codemaker.new
  game.play
  main_menu
end

def main_menu
  puts "\n Mastermind \n You must guess 4-digit number, your have 12 turns.\n # - your correctly guess 1 number,\n *-your guess number, but it in a wrong place  \n 1.Start as Codebreaker(Computer create number)\n 2.Start as Code-maker(You crete, computer guess) \n 3.Exit \nPress number:"
  answer = gets.chomp
  if answer == '1'
    start_codebreaker
  elsif answer == '2'
    start_codemaker
  else
    puts 'Good luck!'
  end
end

main_menu

