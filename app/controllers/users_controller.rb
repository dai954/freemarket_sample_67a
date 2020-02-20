class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @address_user_id = Address.find_by(user_id: current_user.id)
  end

  def new
    render :layout => "mailer.text"
  end

  def show
    @user = User.find(current_user.id)
  end

  def login

  end

  def logout

  end

  def like
    @user = current_user
    @item = Item.all
    @likes = Like.where(user_id: @user.id).all
  end

  def card
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      # redirect_to action: "new"
    else
      @card_user_id = Credit.find_by(user_id: current_user.id)

      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    # binding.pry
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
    params.require(:user).permit(:name, :email)
  end
end