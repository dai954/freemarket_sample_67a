class CommentsController < ApplicationController
  def create
    #ストロングパラメーターを使って、インスタンス変数に代入
    @comment = Comment.new(comment_params)
    #itemテーブルからitem_idを見つけ、インスタンス変数にいれる
    @item = Item.find(params[:item_id])
    #コメントが保存できたら
    if @comment.save
      #item詳細に飛ぶ
      redirect_to item_path(@item)
    else
      #保存失敗したらフラッシュメッセージ表示
      flash[:notice] = "コメント欄が空白です。"
      redirect_to item_path(@item)
    end
  end

  private
  #textカラムには渡されたparamsの中にcommentというハッシュがある二重構造になっているので、requireメソッドで指定してtextを取り出す。
  #user_idカラムには、ログインしているユーザーのidとなるcurrent_user.idを保存し、item_idカラムは、paramsで渡されるようにするので、params[:item_id]として保存する
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

