class Address < ApplicationRecord
  validates :prefecture,:number,:post,:city,presence: true
  has_many :items, dependent: :destroy
end
