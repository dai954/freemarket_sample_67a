class BuyerController < ApplicationController

  def index
    @buyer = Buyer.find(params[:id])
  end
end
