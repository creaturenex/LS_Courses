require "pry"

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # row
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # column
                 [1, 5, 9], [3, 5, 7]] # diagonal
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

player_score = 0
computer_score = 0

def prompt(message)
  puts "=> #{message}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd, ply_score, com_score)
  system 'clear'
  puts " You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "Scoreboard: #{ply_score} wins: #{com_score} loses: ties"
  puts "       |       |"
  puts "   #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}"
  puts "       |       |"
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(ary, join_by = ', ', last = 'or')
  case ary.count
  when 0
    ''
  when 1
    ary[0].to_s
  when 2
    ary.join(' ' + last)
  else
    final = ary.pop
    ary.each { |num| num.to_s }.join(join_by) + join_by + last + ' ' + final.to_s
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that is not a valid choice"
  end

  brd[square] = 'X'
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil

  # defense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end

  #offense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

prompt "Get ready for Tic Tac Toe, the first to 5 wins is the grand champion"
sleep(4)

loop do
  loop do
    board = initialize_board

    display_board(board, player_score, computer_score)

    loop do
      display_board(board, player_score, computer_score)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
    display_board(board, player_score, computer_score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      case detect_winner(board)
        when 'Player'
          player_score += 1
        when 'Computer'
          computer_score += 1
        end
    else
      prompt "It's a tie!"
    end

  break if player_score == 5 || computer_score == 5
  end

  if player_score == 5
    prompt "Player is the grand champion"
  else
    prompt "Computer is the grand champion"
  end

  sleep(4)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  player_score = 0
  computer_score = 0
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe"
sleep(4)
