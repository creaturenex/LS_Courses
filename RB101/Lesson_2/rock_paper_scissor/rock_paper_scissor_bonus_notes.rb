# rock, paper, scissor game

GAME_CHOICES = %w(rock paper scissor lizard Spock)
WIN = { rock: ['scissor', 'lizard'],
        paper: ['rock', 'Spock'],
        scissor: ['paper', 'lizard'],
        lizard: ['paper', 'Spock'],
        Spock: ['rock', 'scissor'] }
# # max win condition stored as a constant as it makes my intent more explicit.
GAME_OVER = 5

def prompt(message)
  puts("=> #{message}")
end

=begin
def game_result(player, computer)
  if WIN.key?(player.to_sym) &&
     WIN.values_at(player.to_sym)[0].include?(computer)
     this conditional is too complicated see correction below
    ' won, '
  elsif WIN.key?(computer.to_sym) &&
        WIN.values_at(computer.to_sym)[0].include?(player)
        this conditional is too complicated see correction below
    ' lost, '
  else
    ' tied, '
  end
end
=end

def game_result(player, computer)
  if WIN[player.to_sym].include?(computer)
    ' won, '
  elsif WIN[computer.to_sym].include?(player)
    ' lost, '
  else
    ' tied, '
  end
end

# changed score_array to score_array as that label was incorrect
def update_total_scores(individual_game_results, score_hash)
  if individual_game_results == ' won, '
    score_hash[:wins] += 1
  elsif individual_game_results == ' lost, '
    score_hash[:losses] += 1
  else
    score_hash[:ties] += 1
  end
end

# change method name to better reflect purpose
# changed score_array to score_array as that label was incorrect
def winner(score_hash)
  if score_hash[:wins] == GAME_OVER
    prompt('Game over you are the Champion and the computer lost!')
  elsif score_hash[:losses] == GAME_OVER
    prompt('Game over the computer is the Champion and you lost!')
  else
    prompt('Keep playing until we have a Champion!')
    sleep 1.5
  end
end

# added method to better display score
def display_score(score_hash)
  "- wins: #{score_hash[:wins]} - losses: #{score_hash[:losses]} " \
 "- ties: #{score_hash[:ties]}"
end

# added method to reset score
def reset_score(score_hash)
  score_hash.transform_values! { |_| 0 }
end

def user_choice_abrevation(user_input)
  case user_input
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissor'
  when 'l'
    'lizard'
  when 'v'
    'Spock'
  end
end

# corrected typos
def retrieve_user_choice
  prompt('What is your choice?')
  prompt('Type r for rock, p for paper, s for scissor, l for lizard or' \
    ' v for Spock.')
  user_choice = ''
  loop do
    user_choice = user_choice_abrevation(gets.chomp.downcase)
    break if GAME_CHOICES.include?(user_choice)
    prompt('The only options are r for rock, p for paper, s for scissor,' \
      ' l for lizard or v for Spock.')
  end
  user_choice
end

def play_again?
  prompt('Want to play again? press Y or N')
  play_again = ''
  loop do
    play_again = gets.chomp.downcase
    if play_again == 'n' || play_again == 'y'
      break
    else
      prompt('please type y/Y or n/N')
    end
  end
  # because we have a question mark '?' this method should either return true
  # or false (boolean value) so we are making a comparison against 'y' which
  # will return true/false depending on user input
  play_again == 'y'
end

def clear
  system('clear') || system('cls')
end

def animation
  x = 0
  loop do
    x.times do
      print "░"
    end
    sleep 0.5
    x += 1
    break if x == 6
  end
end

computer_choice = ''
score = { wins: 0, losses: 0, ties: 0 }

# -----------------------------------------------------------------------------
clear

prompt('Get ready to play rock, paper, scissor! Now with lizard and Spock!')

prompt('The player with five wins is the champion!')

animation

loop do
  loop do
    clear
    # Added to show the current score while playing
    prompt("Scoreboard #{display_score(score)}")

    player_choice = retrieve_user_choice

    computer_choice = GAME_CHOICES.sample

    prompt('Game' + game_result(player_choice, computer_choice) +
           "You chose #{player_choice} and the computer chose" \
           " #{computer_choice}")

    update_total_scores(game_result(player_choice, computer_choice), score)
    # changed method name to better reflect purpose
    winner(score)
    # break if score[:wins] == 5 || score[:losses] == 5
    # max win stored as a constant as it makes my intent more explicit.
    break if score[:wins] == GAME_OVER || score[:losses] == GAME_OVER
  end
  # puts score
  # Added to show the final score after playing all the rounds
  prompt("Final Score #{display_score(score)}")
  # score = { wins: 0, losses: 0, ties: 0 }
  # created method to reflect true purpose
  reset_score(score)
  # changed to refect updated method
  break if play_again? == false
end

prompt('Thanks for playing!')
