# rock, paper, scissor game

GAME_CHOICES = %w(rock paper scissor)

WIN = [{ player: 'rock', computer: 'scissor' },
       { player: 'paper', computer: 'rock' },
       { player: 'scissor', computer: 'paper' }]
LOSE = [{ player: 'scissor', computer: 'rock' },
        { player: 'rock', computer: 'paper' },
        { player: 'paper', computer: 'scissor' }]

def prompt(message)
  puts("=> #{message}")
end

def game_result(game_hash)
  if WIN.include?(game_hash)
    ' won'
  elsif LOSE.include?(game_hash)
    ' lost'
  else
    ' tied'
  end
end

def retrieve_user_choice
  prompt('What is your choice? type in rock, paper, or scissor.')
  user_choice = ''
  loop do
    user_choice = gets.chomp.downcase
    break if GAME_CHOICES.include?(user_choice)
    prompt('The only options are rock, paper, scissor.')
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

computer_answer = ''
current_game = {}

# -------------------------------------------------------
prompt('Wait one moment, about to play rock, paper, scissor!')

sleep 3

loop do
  clear

  current_game[:player] = retrieve_user_choice

  computer_answer = GAME_CHOICES.sample

  current_game[:computer] = computer_answer

  prompt('Game' + game_result(current_game) +
         ", You chose #{current_game[:player]}" \
         " and the computer chose #{current_game[:computer]}")

  break if play_again? == 'n'
end

prompt('Thanks for playing!')
