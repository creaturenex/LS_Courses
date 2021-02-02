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
  def initialize
    @value = 'rock'
    @wins = ['scissor', 'lizard']
    @losses = ['paper', 'spock']
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @wins = ['rock', 'spock']
    @losses = ['scissor', 'lizard']
  end
end

class Scissor < Move
  def initialize
    @value = 'scissor'
    @wins = ['paper', 'lizard']
    @losses = ['rock', 'spock']
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @wins = ['paper', 'spock']
    @losses = ['scissor', 'rock']
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @wins = ['scissor', 'rock']
    @losses = ['paper', 'lizard']
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Player
  attr_accessor :move, :name

  def initialize
    set_name
    @history = []
  end

  def history
    puts @history
  end

  def update_history
    @history << move.value
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp.capitalize
      break unless n.empty?
      puts "Sorry please type a name"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice"
    end
    self.move = Kernel.const_get(choice.capitalize).new
  end
end

class R2D2 < Player
  def set_name
    self.name = 'R2D2'
  end

  def choose
    choice = Move::VALUES.clone
    self.move = Kernel.const_get(choice.fetch(0).capitalize).new
  end
end

class Hal < Player
  def set_name
    self.name = 'Hal'
  end

  def available_choices
    @choice = []
    choice = Move::VALUES.clone
    choice.delete_if { |move| move =~ /paper|spock/i }
    choice.each do |move|
      case move
      when 'rock'
        @choice << 'rock'
      when 'scissor'
        3.times { @choice << 'scissor' }
      when 'lizard'
        @choice << 'lizard'
      end
    end
  end

  def choose
    self.available_choices
    self.move = Kernel.const_get(@choice.sample.capitalize).new
  end
end

class Chappie < Player
  def set_name
    self.name = 'Chappie'
  end

  def available_choices
    @choice = []
    choice = Move::VALUES.clone
    choice.delete_if { |move| move =~ /paper|spock/i }
    choice.each do |move|
      case move
      when 'rock'
        @choice << 'rock'
      when 'scissor'
        3.times { @choice << 'scissor' }
      when 'lizard'
        @choice << 'lizard'
      end
    end
  end

  def choose
    self.available_choices
    self.move = Kernel.const_get(@choice.sample.capitalize).new
  end
end

class Sonny < Player
  def set_name
    self.name = 'Sonny'
  end

  def available_choices
    @choice = []
    choice = Move::VALUES.clone
    choice.delete_if { |move| move =~ /rock|scissor/i }
    choice.each do |move|
      case move
      when 'paper'
        @choice << 'paper'
      when 'spock'
        @choice << 'spock'
      when 'lizard'
        @choice << 'lizard'
      end
    end
  end

  def choose
    self.available_choices
    self.move = Kernel.const_get(@choice.sample.capitalize).new
  end
end

class WallE < Player
  def set_name
    self.name = 'Wall-E'
  end

  def available_choices
    @choice = []
    choice = Move::VALUES.clone
    choice.delete_if { |move| move =~ /paper|rock|scissor/i }
    choice.each do |move|
      case move
      when 'spock'
        @choice << 'spock'
      when 'lizard'
        3.times { @choice << 'lizard' }
      end
    end
  end

  def choose
    self.available_choices
    self.move = Kernel.const_get(@choice.sample.capitalize).new
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Scoreboard
  attr_reader :score

  def initialize
    @score = { human: 8, computer: 8, tie: 0 }
  end

  def update_score(winner)
    @score[winner] += 1
  end

  def reset
    initialize
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Messages
  def welcome
    puts "Welcome to Rock, Paper, Scissor!"
    puts "The first player to win 10 games is the grand champion"
  end

  def goodbye
    puts "Thanks for playing Rock, Paper, Scissor. Good bye!"
  end

  def show_moves(human, computer)
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def winner(game_winner, scoreboard)
    player = game_winner
    puts "\nThe grand champion is #{player.name} with a total of:"
    scoreboard.score.each do |k, v|
      case k
      when :human
        puts player.class == Human ? "Wins: #{v}" : "Loses: #{v}"
      when :computer
        puts player.class != Human ? "Wins: #{v}" : "Loses: #{v}"
      when :tie
        puts "Ties: #{v}"
        puts "\n"
      end
    end
  end

  def move_history(player)
    puts "#{player.name} chose the following moves:"
    puts "#{player.history}"
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class RPSGame
  attr_accessor :human, :computer, :scoreboard, :message

  def initialize
    @human = Human.new
    @computer = [R2D2, Hal, Chappie, Sonny, WallE].sample.new
    @scoreboard = Scoreboard.new
    @message = Messages.new
  end

  def round_winner
    if human.move > computer.move
      puts "#{human.name} won the round!"
      :human
    elsif human.move < computer.move
      puts "#{computer.name} won the round!"
      :computer
    else
      puts "It's a tie!"
      :tie
    end
  end

  def game_winner
    winner = scoreboard.score.slice(:human, :computer).key(10)
    if winner == :human
      human
    elsif winner == :computer
      computer
    end
  end

  def game_over?
    scoreboard.score[:human] == 10 || scoreboard.score[:computer] == 10
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n"
    end
    return true if answer == 'y'
    return false if answer == 'n'
  end

  def play
    message.welcome
    loop do
      scoreboard.reset
      until game_over?
        system('clear')
        human.choose
        human.update_history
        computer.choose
        computer.update_history
        message.show_moves(human, computer)
        scoreboard.update_score(round_winner)
        # break if game_over?
        sleep 2
      end
      message.winner(game_winner, scoreboard)
      message.move_history(human)
      message.move_history(computer)
      message.goodbye
      break unless play_again?
    end
  end
end

RPSGame.new.play
