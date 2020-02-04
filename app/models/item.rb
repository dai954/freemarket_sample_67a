class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :buyer, optional: true
  belongs_to :seller, optional: true
  has_many :images
  has_many :comments
  # validates :user, :buyer, :seller, :category, :brand, presence: true
end
