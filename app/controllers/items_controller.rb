class ItemsController < ApplicationController

  before_action :set_item, except: [:index, :new, :create, :destroy]
  require "payjp"
  def index
    @item = Item.includes(:images).all.order(updated_at: :desc)
    @item2 = Item.includes(:images).all

  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    # @item =Item.new(item_params)
    # binding.pry
    Item.create!(item_params)
    # if @item.save
    redirect_to root_path
      # binding.pry
      # respond_to do |format|
      #   format.json
      # end
    # else
      puts "no"
    # end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @image = @item.images
  end

  def update    
  if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    if user_signed_in? && current_user.id == @item.seller_id
      redirect_to root_path, notice: "商品「#{item.name}」を削除しました。"
    else
      redirect_to root_path, notice: "削除できません。"
    end
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
    params.require(:item).permit(:name, :like, :price, :status, :brand, :descripstion, :burden, :method, :indication, :category_id, :brand_id, :buyer_id, :seller_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id, seller_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
