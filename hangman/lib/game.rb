require 'yaml'

class Game
  attr_reader :word
  attr_accessor :arr, :mistakes, :incorrect_letters

  def initialize
    @word = pick_random_line.downcase
    @arr = word_grid(word)
    @incorrect_letters = []
    @mistakes = 0
  end

  def play_game
    while mistakes <= 6
      puts "mistakes: #{mistakes} of 6\nCorrect words: #{arr}\nIncorrect words: #{incorrect_letters}"
      break if input == "save"
      break if game_over?(arr)
    end
  end


  def load_game
    begin
      yaml = YAML.load_file('hangman/saves/saved_game.yml')
      @word = yaml[0].word
      @arr = yaml[0].arr
      @incorrect_letters = yaml[0].incorrect_letters
      @mistakes = yaml[0].mistakes
      puts 'Save Loaded!'
      play_game
    rescue
      puts "Save not found"
    end
  end

  private

  def game_over?(arr)
    puts 'You Lose!' if mistakes >= 6
    if arr.include?('_')
      false
    else
      true
    end
  end

  def check_word(input)
    word_split = word.split('')
    word_split.each_with_index do |val, idx|
      if val == input && arr[idx] == '_'
        arr[idx] = input
      elsif !word.include?(input) || (val == input && arr[idx] != '_')
        @incorrect_letters.push(input)
        @mistakes += 1
        return false
      end
    end
  end

  def word_grid(word)
    Array.new(word.length - 1, '_')
  end

  def input
    puts "Write the letter or 'save' to save end exit"
    input = gets.chomp
    if input.downcase == 'save'
      save_game
    elsif input.downcase.match(/[a-z]/) && input.length == 1
      check_word(input)
    elsif input.empty? || input.length > 1 || !(input.downcase.match(/[a-z]/))
      puts 'Please enter one letter'
      input_result(gets.chomp)
    end
    input
  end

  def pick_random_line
    word = File.readlines('hangman/word_bank.txt').sample
    if (word.length - 1) < 5 || (word.length - 1) > 12
      pick_random_line
    else
      word
    end
  end

  def save_game
    File.open('hangman/saves/saved_game.yml', 'w') { |f| YAML.dump([] << self, f) }
    puts 'Game Saved!'
  end
end


