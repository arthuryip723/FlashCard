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
  
  private
  def card_params
    params.require(:card).permit(:front, :back)
  end
end
