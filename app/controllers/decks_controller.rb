class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
  	@deck = Deck.find(params[:id])
  end

  # This method is used for polling the card
  # It should return a card tht needed to be memorized immediately
  def poll
  	deck = Deck.find(params[:id])
  	# Then find the card
  	# FIXME fix it later, now focus on the valid functionality
  	@card = deck.cards.find_by(state: 'AGAIN')
  	if !@card
  		@card = deck.cards.find_by(state: 'GOOD')
  	end
  	if !@card
  		@card = deck.cards.find_by(state: 'EASY')
  	end
  	# Now I've got the card
  	# Find the deck with the most urgent cards, find the most recent date of modification
  end
end
