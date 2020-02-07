class ItemsController < ApplicationController
  require "payjp"
  def index
    @item = Item.includes(:images).all.order(updated_at: :desc)
    @item2 = Item.includes(:images).all

  end

  def new
    @item = Item.new
  end

  def create
    Item.create!(item_params)
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @image = @item.images
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy

    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path, notice: "商品「#{item.name}」を削除しました。"
  end

  def purchase
    @item = Item.find(params[:id])
    # @user = User.find(current_user.id)
    @user = User.find(2)
    @address = @item.user.addresses
    card = Credit.where(user_id: 1).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      # binding.pry
    end
    render :layout => "mailer.text"
  end

  private
  def item_params
    params.require(:item).permit(:name, :like, :price, :status, :brand, :descripstion, :burden, :method, :indication, :category_id, :brand_id, :buyer_id, :seller_id)
  end
end
# .merge(user_id: current_user.id)