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
      t.integer :area_id
      t.string :size
      
      
      t.timestamps
    end
  end
end
