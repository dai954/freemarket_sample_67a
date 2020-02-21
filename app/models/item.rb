class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :buyer, optional: true
  belongs_to :seller, optional: true
  belongs_to :address, optional: true
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :comments,dependent: :destroy
  belongs_to_active_hash :area, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
  # mount_uploader :images, ImageUploader
  validates :name, :price, :status, :descripstion, :burden, :method, :area_id, :images, presence: true
  # validates :text, presence: true
  
  #itemテーブルから検索するというメソッドのため、modelに記述
  def self.search(search)
    #引数で渡されるsearchの中身に何もなければ全ての投稿を取得できる
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
  
  #ユーザーが既にお気に入り登録しているか確認するメソッド
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
  
end
