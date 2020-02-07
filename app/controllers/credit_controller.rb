class CreditController < ApplicationController
  require "payjp"

  def index
  end

  def new
    card = Credit.where(user_id: current_user.id)
    # card = Credit.where(user_id: 1)
    redirect_to action: "show" if card.exists?
    redirect_to "/users/add" unless card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      # description: '登録テスト', #なくてもOK
      # email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      # metadata: {user_id: 1}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      # @card = Credit.new(user_id: 1, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        # redirect_to "/items"
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Credit.where(user_id: current_user.id).first
    # card = Credit.where(user_id: 1).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      # redirect_to action: "new"
      render delete_credit_index_path
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Credit.where(user_id: current_user.id).first
    # card = Credit.where(user_id: 1).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def purchase
  # 支払い処理
    card = Credit.where(user_id: current_user.id).first
    item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  # buyer_idを保存
    user = User.find(current_user.id)
    item_buyer = Buyer.new
    item_buyer.update(name: user.name)
    item.update(buyer_id: current_user.id)
    redirect_to action: "index" 
  end
  
end
