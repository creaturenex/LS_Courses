# Rock Paper Scissor Game

class Move
  VALUES = ['rock', 'paper', 'scissor', 'lizard', 'spock']
  attr_reader :value, :wins, :losses

  def >(other_move)
    wins.include?(other_move.value)
  end

  def <(other_move)
    losses.include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Rock < Move
  private

  def initialize
    @value = 'rock'
    @wins = ['scissor', 'lizard']
    @losses = ['paper', 'spock']
  end
end

class Paper < Move
  private

  def initialize
    @value = 'paper'
    @wins = ['rock', 'spock']
    @losses = ['scissor', 'lizard']
  end
end

class Scissor < Move
  private

  def initialize
    @value = 'scissor'
    @wins = ['paper', 'lizard']
    @losses = ['rock', 'spock']
  end
end

class Lizard < Move
  private

  def initialize
    @value = 'lizard'
    @wins = ['paper', 'spock']
    @losses = ['scissor', 'rock']
  end
end

class Spock < Move
  private

  def initialize
    @value = 'spock'
    @wins = ['scissor', 'rock']
    @losses = ['paper', 'lizard']
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Player
  attr_accessor :move, :name
  attr_reader :history

  def initialize
    set_name
    @history = []
  end

  def update_history
    @history << move.value
  end
end

class Computer < Player
  def choose
    self.move = Kernel.const_get(@choice.sample.capitalize).new
    # What is the better practice? this method or sampling from an array of
    # object like in line 267.
  end
end

class Human < Player
  INPUT = %w(r p s l v)

  private

  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp.capitalize
      break unless n.match?(/\W/) || n.empty?
      puts "Sorry please type a name"
    end
    self.name = n
  end

  public

  def choose
    choice = nil
    loop do
      puts "Please type "\
        "r for rock, p for paper, s for scissors, l for lizard, or v for spock:"
      choice = gets.chomp.downcase
      break if INPUT.include?(choice)
      puts "Sorry, invalid choice"
    end
    choice = Move::VALUES[INPUT.index(choice)].capitalize
    self.move = Kernel.const_get(choice).new
  end
end

class R2D2 < Computer
  def initialize
    super
    @choice = ['rock']
  end

  def set_name
    self.name = 'R2D2'
  end
end

class Hal < Computer
  def initialize
    super
    @choice = ['rock', 'scissor', 'scissor', 'scissor', 'lizard']
  end

  def set_name
    self.name = 'Hal'
  end
end

class Chappie < Computer
  def initialize
    super
    @choice = ['rock', 'rock', 'scissor', 'scissor', 'lizard']
  end

  def set_name
    self.name = 'Chappie'
  end
end

class Sonny < Computer
  def initialize
    super
    @choice = ['paper', 'lizard', 'spock']
  end

  def set_name
    self.name = 'Sonny'
  end
end

class WallE < Computer
  def initialize
    super
    @choice = ['spock', 'spock', 'lizard', 'lizard', 'lizard']
  end

  def set_name
    self.name = 'Wall-E'
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Scoreboard
  attr_reader :result

  def initialize
    @result = { Wins: 0, Losses: 0, Ties: 0 }
  end

  def update_score(winner)
    @result[winner] += 1
  end

  def reset
    initialize
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

module Messages
  private

  def display_welcome
    puts "Welcome #{human.name} to Rock, Paper, Scissor, Lizard, Spock!"
    puts "The first player to win 10 games is the grand champion"
  end

  def display_goodbye
    puts "Thanks for playing Rock, Paper, Scissor, Lizard, Spock. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_player_won
    score.result.each { |key, value| puts "#{key}: #{value}" }
  end

  def display_computer_won
    score.result.each do |key, value|
      case key
      when :Wins
        puts "Loses: #{value}"
      when :Losses
        puts "Wins: #{value}"
      when :Ties
        puts "#{key}: #{value}"
      end
    end
  end

  def display_winner(game_winner)
    champion = game_winner
    puts "\n" + "The grand champion is #{champion.name} with a total of:"
    champion == human ? display_player_won : display_computer_won
  end

  def display_move_history
    puts "\n" + "#{human.name} chose the following moves:"
    puts human.history
    puts "\n" + "#{computer.name} chose the following moves:"
    puts computer.history
  end

  def display_play_again
    puts "Resetting scoreboard..."
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class RPSGame
  include Messages
  GOAL_WINS = 10
  attr_accessor :human, :computer, :score

  private

  def initialize
    @human = Human.new
    @computer = [R2D2, Hal, Chappie, Sonny, WallE].sample.new
    @score = Scoreboard.new
  end

  def round_winner
    if human.move > computer.move
      puts "#{human.name} won the round!"
      :Wins
    elsif human.move < computer.move
      puts "#{computer.name} won the round!"
      :Losses
    else
      puts "It's a tie!"
      :Ties
    end
  end

  def game_winner
    winner = score.result.slice(:Wins, :Losses).key(GOAL_WINS)
    if winner == :Wins
      human
    elsif winner == :Losses
      computer
    end
  end

  def game_over?
    score.result[:Wins] == GOAL_WINS ||
      score.result[:Losses] == GOAL_WINS
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def play_full_round
    system('clear')
    human.choose
    human.update_history
    computer.choose
    computer.update_history
    display_moves
    score.update_score(round_winner)
    sleep 2
  end

  def play_full_game
    score.reset
    sleep 5
    until game_over?
      play_full_round
    end
    display_winner(game_winner)
    display_move_history
  end

  public

  def play
    display_welcome
    loop do
      play_full_game
      break unless play_again?
      display_play_again
    end
    display_goodbye
  end
end

RPSGame.new.play
