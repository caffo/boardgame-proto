$LOAD_PATH << "./lib"

require 'rubygems'
require 'pry'

require 'player'
require 'dice'
require 'deck'
require 'card'
require 'hand'
require 'challenge'

player = Player.new(:hp => 20, :attack => 5, :level => 1)
hand   = Hand.new
cards  = [ 
          Card.new(:mob => 12),
          Card.new(:mob => 10),
          Card.new(:mob => 15)
        ] 

deck = Deck.new(cards)
xp   = Deck.new

deck.shuffle!

# deck.draw.to(hand)
# puts hand
# puts deck

challenge = Challenge.new(
 :card       => deck.draw,
 :test       => 1.d20.roll + player.attack,
 :solve      => Proc.new{ self[:test] - self[:card].mob > 0 ? "pass" : "fail" },
 :discard_to => xp
)



p challenge.solve

# using entr to keep it running - http://entrproject.org/
# find . -name '*.rb' | entr ruby main.rb

puts "** [#{Time.now}] -- #{Kernel.local_variables}"