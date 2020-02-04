class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :prefecture
      t.string :post
      t.string :city
      t.integer :number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
