class Seller < ApplicationRecord
  has_many :items
  has_many :users
  # validates :content, presence: true, unless: :image?
  # mount_uploader :image, ImageUploader
end
