class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :buyer, optional: true
  belongs_to :seller, optional: true,dependent: :destroy
  belongs_to :address, optional: true
  has_many :images, dependent: :destroy
  has_many :comments
  belongs_to_active_hash :area, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
  # mount_uploader :images, ImageUploader
  validates :name, :price, :status, :descripstion, :burden, :method, :area_id, :images, presence: true
  # validates :text, presence: true
end
