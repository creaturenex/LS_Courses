class GuessingGame
  RANGE = (1..100)
  RESULTS = { WIN: "You Won!", LOST: "You have no more guesses, You lost!" }
  @@guesses = 7
  attr_accessor :guess

  def play
    @number = rand(RANGE)
    puts "#{@number}"
    7.times do
      guess_remaining
      prompt
      @result_outcome = result
      break if @guess == @number
    end
    winner
  end

  private

  def guess_remaining
    puts ''
    puts "You have #{@@guesses} guesses remaining"
  end

  def prompt
    puts "Enter a number between 1 and 100:"
    @guess = gets.chomp.to_i
    @@guesses -= 1
  end

  def result
    if (RANGE).none?(@guess)
      puts "Invalid guess."
    elsif @guess > @number
      puts "Your guess is too high."
    elsif @guess < @number
      puts "Your guess is too low."
    else
      puts "That's the number!"
      :WIN
    end
  end

  def winner
    puts @result_outcome == :WIN ? RESULTS[:WIN] : RESULTS[:LOST]
  end
end

game = GuessingGame.new
game.play
