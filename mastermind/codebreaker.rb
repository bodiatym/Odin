class Codebreaker
  def initialize
    random_numbers = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)].map(&:to_s)
    @code = random_numbers.map(&:to_s)
  end

  def play
    player_turns
    ending
  end

  private

  def player_turns
    turn = 1
    while turn <= 10
      puts "\nTry to guess:"
      @guess = player_input.split(//)
      break if solved?(@guess)
      feedback(@guess)
      turn += 1
    end
  end

  def player_input
    input = gets.chomp
    return input if input.match(/^[1-6]{4}$/)

    puts "\nWrite number properly"
    player_input
  end

  def feedback(input)
    same_number = 0
    inaccurate_number = 0
    input = input.clone
    input_without_same = input.clone
      input_without_same.each_with_index do |number, index|
        input_without_same[index] = '0' if number == @code[index]
    end
    @code.each_with_index  do |number, index|
      if input[index] == number
        same_number += 1
      elsif input_without_same.include?(number)
        inaccurate_number += 1
        index = input_without_same.find_index(number)
        input_without_same[index] = '0'
      end
    end
    same_number.times do
      print("#")
    end
    inaccurate_number.times do
      print("*")
    end
  end

  def solved?(guess)
    guess == @code
  end

  def ending
    if solved?(@guess)
      puts "\nYour Wins. Congratulations!!!!!!"
    else
      puts "\nYour lose. Code is: #{@code}"
    end
  end
end

