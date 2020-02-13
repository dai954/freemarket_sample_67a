class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #deviseのデフォルトバリデーションはemail,passwordのみのため、追加しています
  validates :name,:ruby_first,:ruby_last,:first_name,:last_name,:birthday, presence: true
  has_many :credits
  has_many :items
  has_many :addresses
  belongs_to :buyer, optional: true
  belongs_to :seller,optional: true,dependent: :destroy
end
