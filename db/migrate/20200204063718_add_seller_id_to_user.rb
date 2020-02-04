class AddSellerIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :seller, foreign_key: true
  end
end
