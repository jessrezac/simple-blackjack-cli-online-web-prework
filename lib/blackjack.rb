def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  card = rand(1..11)
end

def display_card_total(card_total)
  # code #display_card_total here
  puts "Your cards add up to #{card_total}"
  return card_total
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  gets.chomp
end

def end_game(card_total, dealer_hand)
  # code #end_game here
  if card_total < 21 && dealer_hand >= 21
    puts "Congratulations, you won with #{card_total}! Dealer had #{dealer_hand}. Thanks for playing!"
  elsif card_total < 21 && dealer_hand < 21
    user_margin = 21 - card_total
    dealer_margin = 21 - dealer_hand
    if user_margin > dealer_margin
      puts "Sorry, you lost. Dealer had #{dealer_hand}. Thanks for playing!"
    else
      puts "You won! You had #{card_total} and dealer had #{dealer_hand}. Thanks for playing!"
    end
  else
    puts "Sorry, you hit #{card_total}. Thanks for playing!"
  end
end

def initial_round
  # code #initial_round here
  display_card_total(deal_card + deal_card)
end

def hit?(card_total)
  until card_total >= 21
    prompt_user
    user_input = get_user_input
    if user_input == "h"
      card_total = card_total + deal_card
      display_card_total(card_total)
    elsif user_input == "s"
      break
      return card_total
    else
      invalid_command
      return card_total
    end
  end

  return card_total
end

def invalid_command
  # code invalid_command here
  puts "Please enter a valid command"
end

def play_dealer
  dealer_hand = deal_card + deal_card
  while dealer_hand <= 16
    dealer_hand = dealer_hand + deal_card
  end
  return dealer_hand
end

def new_game?
  puts "Type 'y' to play again or any key to quit"
  user_input = get_user_input
  if user_input == "y"
    runner
  else
    puts "Thanks for playing!"
  end
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  # code runner here
  welcome
  card_total = initial_round
  hit?(card_total)
  dealer_hand = play_dealer
  end_game(card_total, dealer_hand)
  new_game?
end
