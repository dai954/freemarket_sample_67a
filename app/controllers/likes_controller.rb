class LikesController < ApplicationController
  before_action :set_post

  def index
    @user = current_user
    @likes = Like.where(user_id: @user.id).all
    
  end

  def create
    
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    @likes = Like.where(item_id: params[:item_id])
    @item.reload
  end

  def destroy
    
    like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    like.destroy
    @likes = Like.where(item_id: params[:item_id])
    @item.reload
  end



    

  private

  def set_post
    @item = Item.find(params[:item_id])
  end
end
