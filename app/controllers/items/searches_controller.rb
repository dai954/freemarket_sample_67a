class Items::SearchesController < ApplicationController
  #検索結果の一覧表示するアクション定義
  def index
    @items = Item.search(params[:keyword])
  end
end
