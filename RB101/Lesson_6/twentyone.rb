require 'pry'
PLAYER = 'Player'
DEALER = 'Dealer'
ROYAL_CARDS = %w(King Queen Jack Ace)
SUIT = %w(Spade Heart Club Diamond)
MINIMUM_HAND = 17
WINNING_HAND = 21

def cool_line
  puts '*' * 80
end

def prompt(message)
  puts "=> #{message}"
  File.write("/home/oscar/LS_Courses/RB101/Lesson_6/twentyone_log.txt", "#{Time.now}:\n #{message}\n", mode: "a")
end

def initialize_deck(deck)
  SUIT.each do |suit|
    ROYAL_CARDS.each { |royal| deck << "#{royal} of #{suit}" }
    (2..10).each { |num| deck << "#{num} of #{suit}" }
  end
  deck
end

def deal_card(deck, hand, times = 1)
  hand << deck.sample(times)
  hand.flatten!.each { |card| deck.delete(card) }
  prompt 'Card dealt'
end

def sort_hand(hand)
  sorted_hand = []
  sorted_hand << hand.select { |card| card if !card.include?('Ace') }
  sorted_hand << hand.select { |card| card if card.include?('Ace') }
  sorted_hand.flatten!
end

def total(hand)
  sum = 0
  sort_hand(hand).each do |card|
    if card.include?('2')
      sum += 2
    elsif card.include?('3')
      sum += 3
    elsif card.include?('4')
      sum += 4
    elsif card.include?('5')
      sum += 5
    elsif card.include?('6')
      sum += 6
    elsif card.include?('7')
      sum += 7
    elsif card.include?('8')
      sum += 8
    elsif card.include?('9')
      sum += 9
    elsif card.include?('10')
      sum += 10
    elsif card.include?('King')
      sum += 10
    elsif card.include?('Queen')
      sum += 10
    elsif card.include?('Jack')
      sum += 10
    elsif card.include?('Ace')
      if sum <= 10 && hand.count('Ace') == 1
        sum += 11
      elsif sum <= 9 && hand.count('Ace') <= 2
        sum += 11
      elsif sum <= 8 && hand.count('Ace') <= 3
        sum += 11
      elsif sum <= 7 && hand.count('Ace') <= 4
        sum += 11
      elsif sum <= 6
        sum += 11
      else
        sum += 1
      end
    end
  end
  sum
end

def bust?(hand_total)
  hand_total > WINNING_HAND
end

def who_won(player_total, dealer_total)

  if bust?(player_total)
    :player_bust
  elsif bust?(dealer_total)
    :dealer_bust
  elsif player_total > dealer_total
    :player_won
  elsif dealer_total > player_total
    :dealer_won
  else
    :tied
  end
end

def display_winner(player_total, dealer_total)
  result = who_won(player_total, dealer_total)
  case result
  when :player_bust
    prompt 'Bust! You Lost!'
  when :dealer_bust
    prompt 'Dealer Bust!, You Won!'
  when :player_won
    prompt 'You Won!'
  when :dealer_won
    prompt 'You Lost!'
  when :tied
    prompt 'Game Tied'
  end
end

def update_scoreboard (player_total, dealer_total, score_board)
  result = who_won(player_total, dealer_total)
  case result
  when :player_bust
    score_board[:losses] += 1
  when :dealer_bust
    score_board[:wins] += 1
  when :player_won
    score_board[:wins] += 1
  when :dealer_won
    score_board[:losses] += 1
  when :tied
    score_board[:ties] += 1
  end
end

def display_hand(hand, hand_total, opponent)
  prompt "#{opponent} hand: #{hand.join(', ')}" \
  " with a total value of #{hand_total}"
end

def play_again?
  prompt 'Play again? type Yes or No?'
  answer = ''
  loop do
    answer = gets.chomp.downcase
    File.write("/home/oscar/LS_Courses/RB101/Lesson_6/twentyone_log.txt", "#{Time.now}:\n #{answer}\n", mode: "a")
    if answer == 'yes' || answer == 'no'
      break
    else
      prompt "To exit the program type 'no', to play again type 'yes'."
    end
  end
  answer.start_with?('y')
end

def hit_or_stay
  result = ''
  prompt "Want to hit or stay?, please type 'hit' or 'stay'"
  loop do
    result = gets.chomp.downcase
    File.write("/home/oscar/LS_Courses/RB101/Lesson_6/twentyone_log.txt", "#{Time.now}:\n #{result}\n", mode: "a")
    if result == 'hit' || result == 'stay'
      break
    else
      prompt "Incorrect answer, please type 'hit' or 'stay'"
    end
  end
  result
end

def grand_champ(score_board)
  if score_board[:wins] > score_board[:losses]
  prompt "The Player is the Grand Champion"
  else
  prompt "The Dealer is the Grand Champion, cause the House always wins"
  end
end

system 'clear'
prompt 'Welcome to Blackjack!'
prompt 'The first to five wins is the Grand Champion'
sleep(2)

loop do
  scoreboard = {wins: 0, losses: 0, ties: 0}

  loop do
    current_deck = []
    player_hand = []
    dealer_hand = []
    player_total = 0
    dealer_total = 0

    system 'clear'
    prompt "<< Scoreboard >> <> #{scoreboard[:wins]}: WINS <>" \
    " #{scoreboard[:losses]}: LOSSES <> #{scoreboard[:ties]}: TIES <>"
    prompt 'Please wait while the cards are shuffled and dealt'
    sleep(2)
    initialize_deck(current_deck)
    deal_card(current_deck, player_hand, 2)
    player_total = total(player_hand)
    deal_card(current_deck, dealer_hand, 2)
    dealer_total = total(dealer_hand)
    cool_line
    display_hand(player_hand, player_total, PLAYER)
    prompt "Dealer hand: #{dealer_hand[0]} with other card face down"
    answer = hit_or_stay

    if answer == 'hit'
      loop do
        deal_card(current_deck, player_hand)
        player_total = total(player_hand)
        display_hand(player_hand, player_total, PLAYER)
        break if bust?(player_total)
        answer = hit_or_stay
        break if answer == 'stay'
      end
    end

    if answer == 'stay'
      loop do
        break if dealer_total >= MINIMUM_HAND
        display_hand(dealer_hand, dealer_total, DEALER)
        deal_card(current_deck, dealer_hand)
        dealer_total = total(dealer_hand)
        break if bust?(dealer_total)
      end
    end

    cool_line
    display_winner(player_total, dealer_total)
    prompt 'Final Cards'
    display_hand(player_hand, player_total, PLAYER)
    display_hand(dealer_hand, dealer_total, DEALER)
    sleep(5)
    update_scoreboard(player_total, dealer_total, scoreboard)
    break if scoreboard[:wins] == 5 || scoreboard[:losses] == 5
  end
  grand_champ(scoreboard)
  break unless play_again?
end
prompt 'Thanks for playing'
sleep(2)
#
