class AddBuyerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :buyer, foreign_key: true
  end
end
