class ItemsController < ApplicationController
  require "payjp"
  def index
    @item = Item.includes(:images).all.order(updated_at: :desc)
    @item2 = Item.includes(:images).all

  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      @item.update(seller_id: current_user.id)
      redirect_to root_path
    else
      @item.images.new
      render action: :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @image = @item.images.new
  end

  def show
    @item = Item.find(params[:id])
    @area = Area.find(@item.area_id)
    @image = @item.images
    #show.html.hamlでform_withを使用して、comments#createにアクション先を飛ばしたいので、@comment = Comment.newとインスタンス生成をしないといけません。
    @comment = Comment.new
    #itemsテーブルとcommentsテーブルはアソシエーションが組まれているので、@items.commentsとすることで、@itemについて投稿された全てのコメントのレコードを取得することができる。
    #ビューでは誰のコメントかを明らかにするために、アソシエーションを使ってユーザーのレコードを取得する処理をする。またincludesメソッドを使って、N+1問題を解決している。
    @comments = @item.comments.includes(:user)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "編集しました。"
      redirect_to

    else
      flash[:notice] = "必須項目が空欄です。"
      render :edit
    end
  end

  def destroy
    #item全てをインスタンス変数にいれる
    @item = Item.find(params[:id])
    #ログインかつ現ユーザーで出品者本人なら削除可能
    if user_signed_in? && current_user.id == @item.seller_id && @item.destroy
      #削除したらホームへ戻り、フラッシュメッセージ
      flash[:notice] = "商品「#{@item.name}」を削除しました。"
      redirect_to root_path
    else
      #上記の条件以外なら削除不可
      flash[:notice] = "削除できません。"
      redirect_to root_path
    end
  end

  def purchase
    @item = Item.find(params[:id])
    @user = User.find(current_user.id)
    # @user = User.find(2)
    @address = @item.user.addresses
    card = Credit.where(user_id: current_user.id).first
    # card = Credit.where(user_id: 1).first
    if card.blank?
      redirect_to "/users/add"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      render :layout => "mailer.text"
    end
  end



  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # .childrenは直下の子要素を取得する///この場合子要素のみ取得する
    # 全て取得するなら.find()
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
      #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(:name, :like, :price, :status, :brand, :descripstion, :burden, :method, :area_id, :category_id, :brand_id, :seller_id, :buyer_id, images_attributes: [:images, :_destroy, :id]).merge(user_id: current_user.id)
  end
  # def set_item
  #   @item = Item.find(params[:id])
  # end
end
