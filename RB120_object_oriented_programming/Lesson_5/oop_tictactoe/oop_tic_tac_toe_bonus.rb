# frozen_string_literal: true

# Settings
module Settings
  def settings
    puts 'Before we start we need some information from you.'
    choose_name
    choose_human_marker
    choose_computer_marker
    choose_who_goes_first
  end

  private

  def choose_name
    name = nil
    loop do
      puts 'Please type in your name'
      name = gets.chomp.capitalize
      break unless name.empty? || name.match?(/\W/)

      puts 'Please type a name, blank spaces or special characters do not count'
    end
    @name = name
  end

  def choose_human_marker
    choice = nil
    loop do
      puts "Decide on what your marker will be either 'X' or 'O'"
      puts 'Type x for X or o for O'
      choice = gets.chomp.upcase
      break if %w[X O].include?(choice)

      puts 'Please type x or o'
    end
    @human_marker = choice
  end

  def choose_computer_marker
    @computer_marker = @human_marker == 'X' ? 'O' : 'X'
  end

  def choose_who_goes_first
    case who_goes_first
    when 1 then @current_marker = @human_marker
    when 2 then @current_marker =  @computer_marker
    when 3 then @current_marker = [@human_marker, @computer_marker].sample
    end
  end

  def who_goes_first
    choice = nil
    loop do
      puts 'Decided on who will go first, you the player, the computer or randomize.'
      puts 'Type 1 for you the player, 2 for the computer or 3 to randomize who goes first'
      choice = gets.chomp.to_i
      break if (1..3).include?(choice)

      puts 'Please type 1 for player, 2 for computer, or 3 for random choice'
    end
    choice
  end
end

# Displays
module Displays
  private

  def display_welcome_message
    puts "Welcome #{human.name} to Tic Tac Toe!"
    puts "The first person to win #{TTTGame::WINNING_SCORE} games is the winner!"
    puts ''
  end

  def display_goodbye_message
    puts "Thanks #{human.name} for playing Tic Tac Toe! Goodbye!"
  end

  def display_winner
    puts "#{winner} the grand champion!"
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      result_human_wins
    when computer.marker
      result_computer_wins
    else
      result_tie
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def clear
    system 'clear'
  end

  def display_board
    display_board_title
    board.draw
    puts ''
  end

  def display_board_title
    puts "You're a #{human.marker}. Score: #{scoreboard.score[:Wins]}"
    puts "#{computer.name} is a #{computer.marker}. Score: #{scoreboard.score[:Loses]}"
    puts ''
  end

  def result_human_wins
    puts 'You won!'
    puts ''
    scoreboard.score[:Wins] += 1
  end

  def result_computer_wins
    puts "#{computer.name} won!"
    puts ''
    scoreboard.score[:Loses] += 1
  end

  def result_tie
    puts "It's a tie!"
    puts ''
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

# class scoreboard
class Scoreboard
  attr_accessor :score

  def initialize
    @score = { Wins: 0, Loses: 0 }
  end

  def reset
    initialize
  end
end

# class board
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts '       |       |'
    puts "   #{@squares[1]}   |   #{@squares[2]}   |   #{@squares[3]}"
    puts '       |       |'
    puts '-------+-------+-------'
    puts '       |       |'
    puts "   #{@squares[4]}   |   #{@squares[5]}   |   #{@squares[6]}"
    puts '       |       |'
    puts '-------+-------+-------'
    puts '       |       |'
    puts "   #{@squares[7]}   |   #{@squares[8]}   |   #{@squares[9]}"
    puts '       |       |'
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3

    markers.min == markers.max
  end
end

# class square
class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

# class player
class Player
  attr_accessor :name
  attr_reader :marker

  def initialize(marker, name)
    @marker = marker
    @name = name
  end
end

# class Human Player
class Human < Player
  DELIMITER = ', '
  JOIN_WORD = 'or'

  def moves(board)
    square = move_choices(board)
    board[square] = marker
  end

  private

  def move_choices(board)
    square = nil
    loop do
      puts "Choose an available square (#{joiner(board.unmarked_keys)}): "
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)

      puts "Sorry, that's not a valid choice."
    end
    square
  end

  def joiner(board)
    case board.size
    when 0
      ''
    when 1
      board.first
    when 2
      board.join(" #{JOIN_WORD} ")
    else
      joiner_for_three_or_more_sq(board)
    end
  end

  def joiner_for_three_or_more_sq(board)
    board[-1] = "#{JOIN_WORD} #{board.last}"
    board.join(DELIMITER)
  end
end

# class Computer Player
class Computer < Player
  def moves(board, human_marker)
    square = move_choices(board, human_marker)
    square ||= if board.squares[5].marker == Square::INITIAL_MARKER
                 5
               else
                 board.unmarked_keys.sample
               end
    board[square] = marker
  end

  private

  def move_choices(board, human_marker)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, human_marker)
      break if square
    end
    square
  end

  def find_at_risk_square(line, board, human_marker)
    mark_at_risk_square(line, board) if at_risk_line(line, marker, board) || at_risk_line(line, human_marker, board)
  end

  def mark_at_risk_square(line, board)
    line.select { |num| board.squares[num].marker == Square::INITIAL_MARKER }.first
  end

  def at_risk_line(line, player_marker, board)
    board.squares.values_at(*line).count { |square| square.marker == player_marker } == 2
  end
end

# class ttt game
class TTTGame
  PC_NAME = %w[R2D2 Hal Chappie Sonny Wall-E].freeze
  WINNING_SCORE = 5

  include Settings
  include Displays

  attr_reader :board, :human, :computer, :scoreboard

  def initialize
    clear
    settings
    @board = Board.new
    @human = Human.new(@human_marker, @name)
    @computer = Computer.new(@computer_marker, PC_NAME.sample)
    @scoreboard = Scoreboard.new
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      game_to_five_wins
      display_winner
      break unless play_again?

      scoreboard.reset
      reset
      display_play_again_message
    end
  end

  def game_to_five_wins
    until scoreboard.score.value?(WINNING_SCORE)
      display_board
      player_moves
      display_result
      sleep 3
      reset
    end
  end

  def player_moves
    loop do
      current_player_moves
      break if board.someone_won? || board.full?

      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_moves
    if human_turn?
      human.moves(board)
      @current_marker = @computer_marker
    else
      computer.moves(board, human.marker)
      @current_marker = @human_marker
    end
  end

  def human_turn?
    @current_marker == @human_marker
  end

  def reset
    board.reset
    clear
  end

  def winner
    winner = scoreboard.score.key(WINNING_SCORE)
    case winner
    when :Wins then 'You are'
    when :Loses then "#{computer.name} is"
    else 'something is wrong'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w[y n].include? answer

      puts 'Sorry, must be y or n'
    end
    answer == 'y'
  end
end

game = TTTGame.new
game.play
