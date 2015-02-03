require 'pry'
require_relative 'card'
require_relative 'hand'
require_relative 'deck'

deck = Deck.new
player_hand = Hand.new
computer_hand = Hand.new

puts "Welcome to Blackjack"

player_hand.hit(deck)
computer_hand.hit(deck)
player_hand.hit(deck)
computer_hand.hit(deck)


player_hand.cards.each do |card|
  puts "Player shows: #{card.value} of #{card.suit}"
end

puts "Player Score: #{player_hand.score}"

while player_hand.score < 22
  puts "Hit (h) or Stay (s)"
  input = gets.chomp
  if input.downcase == 'h'
    player_hand.hit(deck)
    puts "Player drew a(n) #{player_hand.cards.last.value} of #{player_hand.cards.last.suit}"
    puts "Player Score: #{player_hand.score}"
  elsif input.downcase == 's'
    puts "Player final score: #{player_hand.score}"
    break
  else
    puts "Please enter h to hit or s to stay"
  end
end

if player_hand.bust?
  puts "Player has busted."
end

if !player_hand.bust?
  computer_hand.cards.each do |card|
    puts "Computer shows: #{card.value} of #{card.suit}"
  end
  puts "Computer Score: #{computer_hand.score}"

  until computer_hand.score >= 16
    computer_hand.hit(deck)
    puts "Computer drew a(n) #{computer_hand.cards.last.value} of #{computer_hand.cards.last.suit}"
  end

  if computer_hand.bust?
    puts "Computer has busted, player wins"
    puts "Player Score: #{player_hand.score}"
    puts "Computer Score: #{computer_hand.score}"
  elsif player_hand.score > computer_hand.score
    puts "Player Score: #{player_hand.score}"
    puts "Computer Score: #{computer_hand.score}"
    puts "Player wins!"
  elsif
    computer_hand.score > player_hand.score
    puts "Player Score: #{player_hand.score}"
    puts "Computer Score: #{computer_hand.score}"
    puts "computer wins!"
  else
    puts "Player Score: #{player_hand.score}"
    puts "Computer Score: #{computer_hand.score}"
    puts "Draw!"
  end
end
