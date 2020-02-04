class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create!(item_params)
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def purchase
  end
  private
  def item_params
    params.require(:item).permit(:name, :like, :price, :status, :brand, :descripstion, :burden, :method, :indication, :category_id, :brand_id, :buyer_id, :seller_id)
  end
end
# .merge(user_id: current_user.id)