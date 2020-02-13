class ImageController < ApplicationController




  private
  def image_params
    params.require(:images).permit(:images, :item_id)
  end
end
