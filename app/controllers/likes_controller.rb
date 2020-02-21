class LikesController < ApplicationController
  before_action :set_post

  def index
    
  end
  
  
  def create 
    #いいねすることでuser_id,item_idがlikeテーブルに反映される
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    @likes = current_user.likes
    #いいねの数をすぐに反映させる
    @item.reload
  end

  def destroy
    #現ユーザでitem_idとuser_idが合致したデータを探す
    like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    like.destroy
    #whereを使うことで該当データ全てが返ってくる
    @likes = Like.where(item_id: params[:item_id])
    @item.reload
  end



    

  private

  def set_post
    @item = Item.find(params[:item_id])
  end
end
