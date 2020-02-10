class ChangeDataSellerToItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :sellers
    remove_index :items,:seller_id
    remove_reference :items, :seller
  end
end
