class GuessingGame
  RESULTS = { WIN: "You Won!", LOST: "You have no more guesses, You lost!" }
  @@guesses = nil
  attr_accessor :guess

  def initialize(range_start, range_end)
    @range = (range_start..range_end)
    @@guesses = Math.log2(size_of_range).to_i + 1
  end

  def play
    @number = rand(@range)
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
    puts "Enter a number between #{@range.first} and #{@range.last}:"
    @guess = gets.chomp.to_i
    @@guesses -= 1
  end

  def result
    if (@range).none?(@guess)
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

  def size_of_range
    @range.count
  end
end

game = GuessingGame.new(1, 212)
game.play
