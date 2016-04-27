class CardsController < ApplicationController
	# I should use nested url?
  def new
  end
  
  def create
    # @card = Card.new(card_params.merge(state: 'AGAIN'))
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.new(card_params.merge(state: 'AGAIN'))
    if @card.save
      redirect_to deck_card_path @deck, @card
    else
      render 'new'
    end
  end
  
  def show
    @card = Card.find(params[:id])
  end
  
  def edit
    @card = Card.find(params[:id])
    @decks = Deck.all
  end
  
  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      # redirect_to @card
      redirect_to deck_card_path @card.deck, @card
    else
      render 'edit'
    end
  end
  
  private
  def card_params
    params.require(:card).permit(:front, :back, :deck_id)
  end
end
