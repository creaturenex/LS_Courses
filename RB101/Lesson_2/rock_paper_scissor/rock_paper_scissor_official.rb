# rock, paper, scissor game

# defined variables
choices = %w(rock paper scissor)

WIN = [{ player: 'rock', computer: 'scissor' },
       { player: 'paper', computer: 'rock' },
       { player: 'scissor', computer: 'paper' }]
LOSE = [{ player: 'scissor', computer: 'rock' },
        { player: 'rock', computer: 'paper' },
        { player: 'paper', computer: 'scissor' }]

computer_answer = ''
user_answer = ''
play_again = ''
current_game = {}

# defined methods
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

# -------------------------------------------------------
prompt('Want to play rock, paper, scissor?')
sleep 5

loop do
  prompt('What is your choice? type in rock, paper, or scissor.')

  loop do
    user_answer = gets.chomp.downcase
    current_game[:player] = user_answer

    break if choices.include?(user_answer)
    prompt('The only options are rock, paper, scissor.')
  end

  computer_answer = choices.sample
  current_game[:computer] = computer_answer

  prompt('Game' + game_result(current_game) + ", You chose #{user_answer}" \
  " and the computer chose #{computer_answer}")

  prompt('Press Y if you want to play again')
  play_again = gets.chomp.downcase

  break unless play_again == 'y'
end



prompt('Thanks for playing!')
