
# This is a hash that holds the value of each card:

deck = {'Ace' => 11,
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9,
        '10' => 10,
        'Jack' => 10,
        'Queen' => 10,
        'King' => 10
        }

# Here, two cards are drawn, their values are displayed to the user, then added together, and the sum is displayed to the user.
# If the value equals 21, the user gets blackjack and the program quits.

card1 = deck.keys.sample
card2 = deck.keys.sample

puts "Your hand is a #{card1} and a #{card2}."

cardsum = deck.values_at(card1, card2).inject(:+)

if cardsum == 21
      puts 'BLACKJACK!'
      exit
    end

puts "Your total is #{cardsum}."

# Assuming the user did not win, they are given the option to hit or stay. If they choose hit,
# they are dealt a third card, the sum is calculated and they are given their new score.
# If they have an Ace, and their sum exceeds 21, the ace key gets a value of 1 and is merged
# into the deck hash. If they do do not hit, they are given their current score again.

puts 'Would you like to Hit or Stay?'

hitstay = gets.chomp.downcase

if hitstay.include?('hit') == true
  card3 = deck.keys.sample
  puts "Your hand is a #{card1}, #{card2} and a #{card3}."

  cardsum = deck.values_at(card1, card2, card3).inject(:+)

    if cardsum > 21
      acevalue = {'Ace' => 1}
      deck.merge!(acevalue)
      cardsum = deck.values_at(card1, card2, card3).inject(:+)
    end

  puts "Your total is #{cardsum}."

else

  puts "Your total is #{cardsum}."

end

# Now the current score is checked for Blackjack, Bust, and then against the dealers current score.

if cardsum == 21
  puts 'BLACKJACK!'
  exit
end

if cardsum > 21
  puts 'BUST!'
  exit
end

dealer1 = deck.keys.sample
dealer2 = deck.keys.sample

dealersum = deck.values_at(dealer1, dealer2).inject(:+)

puts "The dealer's toal is #{dealersum}."

if dealersum == 21
      puts 'The dealer got BLACKJACK!'

    end

if dealersum > cardsum
  puts 'You lost to the dealer!'
else
  puts 'You beat the dealer! You win!'
end


