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
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
    # self.move = Move.new(choice)
    self.move = Kernel.const_get(choice.capitalize).new
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Wall-E'].sample
  end

  def choose
    # self.move = Move.new(Move::VALUES.sample)
    self.move = Kernel.const_get(Move::VALUES.sample.capitalize).new
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Scoreboard
  attr_reader :score

  def initialize
    @score = { human: 0, computer: 0, tie: 0 }
    puts @score
  end

  def update_score(winner)
    @score[winner] += 1
  end

  def game_over? # move to RPSGAME
    @score[:human] == 10 || @score[:computer] == 10
  end

  def champion(human, computer) # move to RPS GAME
    champion = score.slice(:human, :computer).key(10)
    if champion == :human
      human
    elsif champion == :computer
      computer
    end
  end

  def reset_score
    initialize
  end
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class RPSGame
  attr_accessor :human, :computer, :game_score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @game_score = Scoreboard.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissor!"
    puts "The first player to win 10 games is the grand champion"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissor. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      :human
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      :computer
    else
      puts "It's a tie!"
      :tie
    end
  end

  def display_champion
    puts "The grand champion is "\
    "#{game_score.champion(human.name, computer.name)}"
    puts game_score.score
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
    display_welcome_message
    loop do
      game_score.reset_score
      loop do
        system('clear')
        human.choose
        computer.choose
        display_moves
        game_score.update_score(display_winner)
        break if game_score.game_over?
        sleep(2)
      end
    display_champion
    display_goodbye_message
    break unless play_again?
    end
  end

end


RPSGame.new.play
