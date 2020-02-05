class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :like
      t.integer :price
      t.integer :status
      t.text :descripstion
      t.string :burden
      t.string :method
      t.string :indication
      t.string :size
      
      # t.references :user, foreign_key: true
      # t.references :brand, foreign_key: true
      # t.references :category, foreign_key: true
      # t.references :seller, foreign_key: true
      # t.references :buyer, foreign_key: true


      t.timestamps
    end
  end
end
