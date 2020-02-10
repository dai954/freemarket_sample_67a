class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :buyer, optional: true
  belongs_to :seller, optional: true,dependent: :destroy
  belongs_to :address, optional: true
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  # validates :user, :buyer, :seller, :category, :brand, presence: true
end
