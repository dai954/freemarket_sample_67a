class Address < ApplicationRecord
  validates :prefecture,:number,:post,:city,:building,presence: true
  has_many :items, dependent: :destroy
end
