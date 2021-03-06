class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end
  
  def new
    @deck = Deck.new
  end

  def show
  	@deck = Deck.includes(:cards).find(params[:id])
    @cards = @deck.cards
    @again_cards = @cards.select{|card| card.state == 'AGAIN'}
    @good_cards = @cards.select{|card| card.state == 'GOOD'}
    @easy_cards = @cards.select{|card| card.state == 'EASY'}
  end

  # This method is used for polling the card
  # It should return a card tht needed to be memorized immediately
  def poll
  	# deck = Deck.find(params[:id])
  	# # Then find the card
  	# # FIXME fix it later, now focus on the valid functionality
   #  # TODO Now I need to add the state field to the model
   #  # IDEA This is for you to write ideas
   #  # NOTE This is for you to know the notes
   #  # For now just use a string for what we need.
  	# @card = deck.cards.find_by(state: 'AGAIN')
  	# if !@card
  	# 	@card = deck.cards.find_by(state: 'GOOD')
  	# end
  	# if !@card
  	# 	@card = deck.cards.find_by(state: 'EASY')
  	# end
  	# Now I've got the card
  	# Find the deck with the most urgent cards, find the most recent date of modification
    if request.get?
      # debugger
      # byebug
      # raise
      @card = poll_a_new_card(params[:id])
    elsif request.post?
      next_poll
      # if all cards are marked easy, round is finished.
    end
  end
  
  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to @deck
    else
      render 'new'
    end
  end

  private
  def deck_params
    params.require(:deck).permit(:name)
  end
  
  def next_poll
    # 1, First get the card
    @card = Card.find(params[:card_id])
    # 2, Then set the card to a certain state
    # How do I get the state?
    # @card.update(state: 'GOOD')
    @card.update(state: params[:state], updated_at: DateTime.now)
    # 3, Poll another card
    @card = poll_a_new_card(params[:id])
    @deck = Deck.find(params[:id])
    # render :poll
  end

  def poll_a_new_card(deck_id)
    deck = Deck.find(params[:id])
    # Need to get the earliest updated card.
    # Query, order by, then get the first one.
    # Use a where clause
    card = deck.cards.where(state: 'AGAIN').order(:updated_at).first
    if !card
      card = deck.cards.where(state: 'GOOD').order(:updated_at).first
    end
    # if !card
    #   card = deck.cards.where(state: 'EASY').order(:updated_at).first
    # end
    card
  end
end
