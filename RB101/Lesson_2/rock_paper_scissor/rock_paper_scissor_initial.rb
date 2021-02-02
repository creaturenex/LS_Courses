# rock, paper, scissor game

choices = %w(rock paper scissor)
computer_answer = ''
user_answer = ''
play_again = ''

puts 'Want to play rock, paper, scissor?'

loop do
  puts 'What is your choice? type in rock, paper, or scissor.'
  computer_answer = choices.sample
  loop do
    user_answer = gets.chomp.downcase
    if choices.include?(user_answer) && choices.include?(computer_answer)
      break
    else
      puts 'The only options are rock, paper, scissor.'
    end
  end
  # rock beats scissor, paper beats rock, scissor beats paper
  if (user_answer == choices[0]) && (computer_answer == choices[2]) ||
     (user_answer == choices[1]) && (computer_answer == choices[0]) ||
     (user_answer == choices[2]) && (computer_answer == choices[1])
    game_result = 'won'
  elsif user_answer == computer_answer
    game_result = 'tied'
  else
    game_result = 'lost'
  end

  puts "Game #{game_result}, You chose #{user_answer}" \
       " and the computer chose #{computer_answer}"

  puts 'Want to play again? press Y or N'

  loop do
    play_again = gets.chomp.downcase
    puts 'please type y/Y or n/N' unless play_again == 'n' || play_again == 'y'
    break if play_again == 'n' || play_again == 'y'
  end
  break if play_again == 'n'
end

puts 'Thanks for playing!'
