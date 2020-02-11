class UsersController < ApplicationController
  def index

  end

  def new
    render :layout => "mailer.text"
  end

  def show

  end

  def login

  end

  def logout

  end

  def card
    card = Credit.where(user_id: 1).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end

  end
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email).merge(seller_id: current_user.id)
  end
  
end
