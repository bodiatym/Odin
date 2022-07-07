class Codemaker < Codebreaker

  def play
    puts "Create code:"
    @code = player_input.split(//)
    computer_turns
    ending
  end

  private

  def computer_turns
    turn = 1
    old_guesses = []
    while turn <= 10
      old_guesses << @guess.clone
      if turn == 1
        @guess = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)].map(&:to_s)
      else
        @code.each_with_index do |number, index|
            @guess[index] = rand(1..6) if @guess[index] != number
        end
        @guess = @guess.map(&:to_s)
      end
      if old_guesses.include?(@guess)
        next
      end
      puts "\nComputer to guess:"
      p @guess
      break if solved?(@guess)
      feedback(@guess)
      turn += 1
    end
  end

  def ending
    if solved?(@guess)
      puts "\nYour lose.Computer bit your!!! "
    else
      puts "\nYour Wins. Congratulations!!!!!!"
    end
  end
end


