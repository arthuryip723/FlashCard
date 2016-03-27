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
    # TODO Now I need to add the state field to the model
    # IDEA This is for you to write ideas
    # NOTE This is for you to know the notes
    # For now just use a string for what we need.
  	@card = deck.cards.find_by(state: 'AGAIN')
  	if !@card
  		@card = deck.cards.find_by(state: 'GOOD')
  	end
  	if !@card
  		@card = deck.cards.find_by(state: 'EASY')
  	end
    # @card = Card.first
  	# Now I've got the card
  	# Find the deck with the most urgent cards, find the most recent date of modification
  end

  def next
    @card = Card.last
    render :poll
  end
end
