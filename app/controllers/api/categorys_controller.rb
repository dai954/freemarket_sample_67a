class Api::CategorysController < ApplicationController
  def index
    @category = Category.find(params[:keyword]).children
  end
end