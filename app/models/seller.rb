class Seller < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :users, dependent: :destroy
end
