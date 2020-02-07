class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
    @item = Item.all
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
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy

  end

  def purchase
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
