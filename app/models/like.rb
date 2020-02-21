class Like < ApplicationRecord
  #1ユーザーにつき、１つの商品に１回しかlikeできない
  validates :user_id, :uniqueness => {:scope => :item_id}

  belongs_to :user
  #counter_cacheがlike_countを集計してくれる
  belongs_to :item, counter_cache: :like_count
end
