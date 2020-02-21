class Comment < ApplicationRecord
  #コメントが空欄のまま登録されるのを防ぐ
  validates :text, presence: true
  belongs_to :item
  belongs_to :user
end
