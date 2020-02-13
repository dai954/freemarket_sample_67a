class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    Address.create(addresses_params)
    redirect_to users_path
  end
  private
  def addresses_params
    params.permit(:prefecture, :post, :city, :number, :building).merge(user_id: current_user.id)
    
  end
end
