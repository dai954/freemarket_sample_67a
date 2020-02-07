class Buyer < ApplicationRecord
  has_many :itemds
  has_many :users
end
