class Records < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :users, :sellers
    remove_index :users,:seller_id
    remove_reference :users, :seller
  end
end
