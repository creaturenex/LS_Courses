# rock, paper, scissor game

GAME_CHOICES = %w(rock paper scissor lizard Spock)
WIN = { rock: ['scissor', 'lizard'],
        paper: ['rock', 'Spock'],
        scissor: ['paper', 'lizard'],
        lizard: ['paper', 'Spock'],
        Spock: ['rock', 'scissor'] }

def prompt(message)
  puts("=> #{message}")
end

def game_result(player, computer)
  if WIN.key?(player.to_sym) &&
     WIN.values_at(player.to_sym)[0].include?(computer)
    ' won, '
  elsif WIN.key?(computer.to_sym) &&
        WIN.values_at(computer.to_sym)[0].include?(player)
    ' lost, '
  else
    ' tied, '
  end
end

def update_total_scores(individual_game_results, score_array)
  if individual_game_results == ' won, '
    score_array[:wins] += 1
  elsif individual_game_results == ' lost, '
    score_array[:losses] += 1
  else
    score_array[:ties] += 1
  end
end

def total_score(score_array)
  if score_array[:wins] == 5
    prompt('Game over you are the Champion and the computer lost!')
  elsif score_array[:losses] == 5
    prompt('Game over the computer is the Champion and you lost!')
  else
    prompt('Keep playing until we have a Champion!')
    sleep 3
  end
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

def retrieve_user_choice
  prompt('What is your choice?')
  prompt('Type v for rock, p for paper, s for scissor, l for lizard or' \
    'v for Spock.')
  user_choice = ''
  loop do
    user_choice = user_choice_abrevation(gets.chomp.downcase)
    break if GAME_CHOICES.include?(user_choice)
    prompt('The only options are v for rock, p for paper, s for scissor,' \
      'l for lizard or v for Spock.')
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
  play_again
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

# -------------------------------------------------------
clear
prompt('Get ready to play rock, paper, scissor! Now with lizard and Spock!')
prompt('The player with five wins is the champion!')
animation

loop do
  loop do
    clear
    player_choice = retrieve_user_choice
    computer_choice = GAME_CHOICES.sample

    prompt('Game' + game_result(player_choice, computer_choice) +
           "You chose #{player_choice} and the computer chose" \
           " #{computer_choice}")

    update_total_scores(game_result(player_choice, computer_choice), score)

    total_score(score)

    break if score[:wins] == 5 || score[:losses] == 5
  end
  puts score
  break if play_again? == 'n'
end

prompt('Thanks for playing!')
