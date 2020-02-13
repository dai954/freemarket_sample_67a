class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    Address.create(addresses_params)
    redirect_to root_path
  end

  def edit

  end
  private
  def addresses_params
    params.permit(:prefecture, :post, :city, :number, :building).merge(user_id: current_user.id)

  end
end
