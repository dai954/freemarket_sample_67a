class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      Comment.create(comment_params)
      redirect_to item_path(@item)
    else
      flash[:notice] = "コメント欄が空白です。"
      @item = Item.find(params[:item_id])
      redirect_to item_path(@item)
    end

    @item = Item.find(params[:item_id])
    redirect_to item_path(@item)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

