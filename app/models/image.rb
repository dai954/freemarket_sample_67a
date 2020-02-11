class Image < ApplicationRecord
  belongs_to :item, dependent: :destroy
  mount_uploader :images, ImageUploader
end
