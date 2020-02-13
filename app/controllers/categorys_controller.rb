# class CategorysController < ApplicationController

#   def get_category_children
#     #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
#     # .childrenは直下の子要素を取得する///この場合子要素のみ取得する
#     # 全て取得するなら.find()
#     @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
#   end

#  # 子カテゴリーが選択された後に動くアクション
#   def get_category_grandchildren
#       #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
#       @category_grandchildren = Category.find("#{params[:child_id]}").children
#   end
#   private
#   def category_params
#     params.require(:category).permit(:parent_name, :child_id)
# end
